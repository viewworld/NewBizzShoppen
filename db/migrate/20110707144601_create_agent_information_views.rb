class CreateAgentInformationViews < ActiveRecord::Migration
  def self.up
    execute %{
              CREATE VIEW "agent_information_not_upgraded_results" AS
              SELECT "call_results"."creator_id" as "user_id", SUM("campaigns_results"."euro_value") AS "sum", "call_results"."created_at"::DATE
              FROM "call_results"
              INNER JOIN "results" ON "results"."id" = "call_results"."result_id"
              INNER JOIN "campaigns_results" ON "results"."id" = "campaigns_results"."result_id"
              INNER JOIN "leads" as "contacts" ON "call_results"."contact_id" = "contacts"."id"
              WHERE ("results"."final" = 't') AND ("contacts"."type" = 'Contact') AND ("results"."upgrades_to_lead" is false) AND ("results"."is_reported" is true)
              GROUP BY "call_results"."created_at"::DATE, "call_results"."creator_id"
            }
    execute %{
              CREATE VIEW "agent_information_upgraded_results" AS
              SELECT "call_results"."creator_id" as "user_id", SUM("leads"."euro_price") AS "sum", "call_results"."created_at"::DATE
              FROM "call_results"
              INNER JOIN "results" ON "results"."id" = "call_results"."result_id"
              INNER JOIN "leads" as "contacts" ON "call_results"."contact_id"="contacts"."id" AND "contacts"."type" = 'Contact'
              INNER JOIN "leads" "leads" ON "leads"."id" = "contacts"."lead_id" AND "leads"."type" = 'Lead'
              WHERE ("results"."final" = 't') AND ("contacts"."type" = 'Contact') AND ("results"."upgrades_to_lead" is true) AND ("results"."is_reported" is true)
              GROUP BY "call_results"."created_at"::DATE, "call_results"."creator_id"
            }
    execute %{
              CREATE VIEW agent_information as
                SELECT agent_information.user_id, sum(agent_information.sum) AS sum, agent_information.created_at
                FROM
                (
                  SELECT agent_information_upgraded_results.user_id, sum(agent_information_upgraded_results.sum) AS sum, agent_information_upgraded_results.created_at
                  FROM agent_information_upgraded_results
                  GROUP BY agent_information_upgraded_results.user_id, agent_information_upgraded_results.created_at
                  UNION ALL
                  SELECT agent_information_not_upgraded_results.user_id, sum(agent_information_not_upgraded_results.sum) AS sum, agent_information_not_upgraded_results.created_at
                  FROM agent_information_not_upgraded_results
                  GROUP BY agent_information_not_upgraded_results.user_id, agent_information_not_upgraded_results.created_at
                ) agent_information
                GROUP BY agent_information.user_id, agent_information.created_at;
            }
  end

  def self.down
  end
end
