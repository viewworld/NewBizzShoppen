class AddValueToCallResults < ActiveRecord::Migration
  def self.up
    add_column :call_results, :value, :float
    add_column :call_results, :euro_value, :float

    create_table :call_result_fields do |t|
      t.integer :campaigns_result_field_id
      t.integer :call_result_id
      t.float :dynamic_euro_value
    end

    CampaignsResult.joins(:campaign).where("value IS NOT NULL").where("is_dynamic_value = ?", false).each do |cr|
      CallResult.update_all({:value => cr.value, :euro_value => cr.euro_value}, { :result_id => cr.result_id, :contact_id => cr.campaign.contact_ids })
    end

    CampaignsResultField.joins(:campaign).where(:is_dynamic_value => true).each do |crf|
      CallResult.where(:contact_id => crf.campaign.contact_ids, :result_id => crf.result_field.result_id).each do |cr|
        cr.call_result_fields.create(:dynamic_euro_value => crf.dynamic_euro_value, :campaigns_result_field_id => crf.id)
      end
    end

    execute %{
              CREATE OR REPLACE VIEW dynamic_result_values AS
              SELECT distinct(result_values.id) AS id,
              (CASE WHEN result_values.value = '' THEN 0::double precision
                    WHEN result_values.value is NULL THEN 0::double precision
                    ELSE result_values.value::double precision
               END) AS VALUE,
              call_result_fields.dynamic_euro_value AS euro_value,
              call_results.creator_id,
              results.id AS result_id,
              call_results.created_at,
              contacts.campaign_id
              FROM result_values
              INNER JOIN result_fields ON result_fields.id=result_values.result_field_id
              INNER JOIN results ON results.id=result_fields.result_id
              INNER JOIN call_results ON result_values.call_result_id=call_results.id
              INNER JOIN leads as contacts ON call_results.contact_id=contacts.id
              INNER JOIN campaigns_results ON campaigns_results.campaign_id=contacts.campaign_id
              INNER JOIN campaigns_result_fields ON campaigns_result_fields.result_field_id=result_fields.id
              INNER JOIN call_result_fields ON call_result_fields.campaigns_result_field_id=campaigns_result_fields.id
              WHERE
              result_values.field_type like '1' AND campaigns_result_fields.is_dynamic_value = 't' AND campaigns_results.is_dynamic_value = 't'
              AND contacts.type = 'Contact' AND (results.upgrades_to_lead is false) AND (campaigns_results.is_reported is true) AND (results.final is true)
             }

    execute %{
        CREATE OR REPLACE VIEW agent_timesheets_value AS
         SELECT agent_information.user_id, agent_information.campaign_id, sum(agent_information.sum) AS value, agent_information.created_at,
                CASE
                    WHEN date_part('dow'::text, agent_information.created_at) = 0::double precision THEN 6::double precision
                    ELSE date_part('dow'::text, agent_information.created_at) - 1::double precision
                END::integer AS dow, date_part('week'::text, agent_information.created_at)::integer AS week, date_part('year'::text, agent_information.created_at)::integer AS year
           FROM (        (         SELECT call_results.creator_id AS user_id, sum(call_results.euro_value) AS sum, call_results.created_at::date AS created_at, campaigns_results.campaign_id
                                      FROM call_results
                                 JOIN results ON results.id = call_results.result_id
                            JOIN leads contacts ON call_results.contact_id = contacts.id
                       JOIN campaigns_results ON results.id = campaigns_results.result_id
                      WHERE results.final = true AND contacts.type::text = 'Contact'::text AND results.upgrades_to_lead IS FALSE AND campaigns_results.is_reported IS TRUE AND campaigns_results.is_dynamic_value IS FALSE AND contacts.campaign_id = campaigns_results.campaign_id
                      GROUP BY call_results.created_at::date, call_results.creator_id, campaigns_results.campaign_id
                     HAVING sum(call_results.euro_value) > 0::double precision
                        UNION ALL
                                 SELECT call_results.creator_id AS user_id, sum(leads.euro_price) AS sum, call_results.created_at::date AS created_at, leads.campaign_id
                                   FROM call_results
                              JOIN results ON results.id = call_results.result_id
                         JOIN leads contacts ON call_results.contact_id = contacts.id AND contacts.type::text = 'Contact'::text
                    JOIN leads leads ON leads.contact_id = contacts.id AND leads.type::text = 'Lead'::text
                    JOIN campaigns_results ON results.id = campaigns_results.result_id
                   WHERE results.final = true AND contacts.type::text = 'Contact'::text AND results.upgrades_to_lead IS TRUE AND campaigns_results.is_reported IS TRUE AND campaigns_results.campaign_id = leads.campaign_id
                   GROUP BY leads.campaign_id, call_results.created_at::date, call_results.creator_id)
                UNION ALL
                         SELECT dynamic_result_values.creator_id AS user_id, sum(dynamic_result_values.value * dynamic_result_values.euro_value) AS sum, dynamic_result_values.created_at::date AS created_at, dynamic_result_values.campaign_id
                           FROM dynamic_result_values
                          GROUP BY dynamic_result_values.campaign_id, dynamic_result_values.created_at, dynamic_result_values.creator_id
                UNION ALL

                  SELECT call_results.creator_id AS user_id, SUM(generated_leads.euro_price) AS sum, call_results.created_at::date AS created_at, campaigns_results.campaign_id
                  FROM "call_results"
                  INNER JOIN "results" ON "results"."id" = "call_results"."result_id"
                  INNER JOIN campaigns_results ON results.id = campaigns_results.result_id
                  INNER JOIN leads as contacts ON call_results.contact_id=contacts.id
                  INNER JOIN users as members ON members.contact_id = contacts.id AND members.roles_mask & 128 > 0
                  INNER JOIN leads as generated_leads ON members.id = generated_leads.requested_by AND generated_leads.requested_during_upgrade_to_member IS TRUE
                  WHERE
                  ("results"."final" = 't') AND (contacts.type = 'Contact') AND
                  (results.name = 'Upgrade to member') AND (results.generic IS TRUE) AND (campaigns_results.is_reported is true)
                  AND campaigns_results.campaign_id = contacts.campaign_id
                  GROUP BY campaigns_results.campaign_id, call_results.created_at::date, call_results.creator_id) agent_information

          GROUP BY agent_information.user_id, agent_information.created_at, agent_information.campaign_id
         HAVING sum(agent_information.sum) > 0::double precision;
    }
  end

  def self.down
    remove_column :call_results, :value, :float
    remove_column :call_results, :euro_value, :float
  end
end
