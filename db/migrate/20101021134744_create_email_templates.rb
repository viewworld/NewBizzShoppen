class CreateEmailTemplates < ActiveRecord::Migration
  def self.up
    create_table :email_templates do |t|
      t.string :name
      t.string :subject, :nil => false
      t.string :from, :nil => false
      t.string :bcc
      t.string :cc
      t.text :body, :nil => false
      t.text :template
      t.string :uniq_id, :default => nil
      t.boolean :persist, :default => false
      t.timestamps
    end
  end

  def self.down
    drop_table :email_templates
  end
end