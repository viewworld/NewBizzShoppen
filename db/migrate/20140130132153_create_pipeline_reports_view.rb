class CreatePipelineReportsView < ActiveRecord::Migration
  def self.up
    execute %{
    CREATE OR REPLACE VIEW pipeline_reports AS
      SELECT
        lp.owner_id, lp.euro_value, lp.estimate, lp.euro_pipeline_value, lp.state,
        lp.decision_date,
        date_part('week'::text, decision_date)::integer AS week,
        date_part('month'::text, decision_date)::integer AS month,
        l.header, l.company_name, l.contact_name
      FROM
        lead_purchases as lp
      INNER JOIN
        leads as l on l.id = lp.lead_id
      WHERE
        lp.accessible_from IS NOT NULL AND lp.decision_date IS NOT NULL
    }
  end

  def self.down
  end
end
