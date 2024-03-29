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
      t.timestamps
    end
  end

  def self.down
    drop_table :email_templates
  end
end
