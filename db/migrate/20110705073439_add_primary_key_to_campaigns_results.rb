class AddPrimaryKeyToCampaignsResults < ActiveRecord::Migration
  def self.up

    #Add primary key

    sql = %{
      ALTER TABLE campaigns_results ADD COLUMN "id" INTEGER;
      CREATE SEQUENCE "campaigns_results_id_seq";
      UPDATE campaigns_results SET id = nextval('"campaigns_results_id_seq"');
      ALTER TABLE campaigns_results
      ALTER COLUMN "id" SET DEFAULT nextval('"campaigns_results_id_seq"');
      ALTER TABLE campaigns_results
      ALTER COLUMN "id" SET NOT NULL;
      ALTER TABLE campaigns_results ADD UNIQUE ("id");
      ALTER TABLE campaigns_results DROP CONSTRAINT "campaigns_results_id_key" RESTRICT;
      ALTER TABLE campaigns_results ADD PRIMARY KEY ("id");
      ALTER TABLE campaigns_results ADD UNIQUE ("id");
    }

    ActiveRecord::Migration.execute sql

    add_column :results, :is_success, :boolean, :default => false
    add_column :results, :is_reported, :boolean, :default => false
    add_column :campaigns_results, :value, :float
    add_column :campaigns_results, :euro_value, :float
    add_column :campaigns_results, :expected_completed_per_hour, :float
  end

  def self.down
    remove_column :campaigns_results, :value
    remove_column :campaigns_results, :euro_value
    remove_column :campaigns_results, :expected_completed_per_hour
    remove_column :campaigns_results, :is_success
    remove_column :campaigns_results, :is_reported
  end
end
