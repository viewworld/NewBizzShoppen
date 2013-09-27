class CreateNewsletterListSubscribers < ActiveRecord::Migration
  def self.up
    create_table :newsletter_list_subscribers do |t|
      t.integer :newsletter_list_id
      t.string :company_name
      t.string :company_phone_number
      t.string :address_line_1
      t.string :address_line_2
      t.string :address_line_3
      t.string :zip_code
      t.string :country_id
      t.string :region_id
      t.string :company_vat_no
      t.string :company_ean_number
      t.string :contact_name
      t.string :contact_title
      t.string :direct_phone_number
      t.string :phone_number
      t.string :email_address
      t.string :linkedin_url
      t.string :facebook_url
      t.text :note
      t.string :login_key
      t.integer :creator_id
      t.string :creator_type
      t.integer :subscriber_id
      t.string :subscriber_type
      t.integer :newsletter_source_id
      t.timestamps
    end
  end

  def self.down
    drop_table :newsletter_list_subscribers
  end
end
