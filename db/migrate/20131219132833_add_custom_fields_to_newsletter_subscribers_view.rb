class AddCustomFieldsToNewsletterSubscribersView < ActiveRecord::Migration
  def self.up
    execute %{
            DROP VIEW newsletter_subscribers;

            CREATE VIEW newsletter_subscribers AS
                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, 'Contact' as subscriber_type, leads.id as subscriber_id, leads.email_address, leads.contact_name as name, leads.company_name as company_name, leads.zip_code as zip_code, company_ean_number, null as company_vat_no, null as contact_title, address_line_1, address_line_2, address_line_3, direct_phone_number, null as phone, region_id, country_id, pnumber, nnmid, custom_1, custom_2, custom_3, custom_4, custom_5
                from newsletter_sources
                inner join leads on leads.campaign_id = newsletter_sources.sourceable_id
                where newsletter_sources.source_type = 0 and leads.type = 'Contact' and leads.email_address <> '' and leads.contact_name <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, 'Lead' as subscriber_type, leads.id as subscriber_id, leads.email_address, leads.contact_name as name, leads.company_name as company_name, leads.zip_code as zip_code, company_ean_number, null, null, address_line_1, address_line_2, address_line_3, direct_phone_number, null, region_id, country_id, pnumber, nnmid, custom_1, custom_2, custom_3, custom_4, custom_5
                from newsletter_sources
                inner join categories parent_category on parent_category.id = newsletter_sources.sourceable_id
                inner join leads on leads.category_id in (select categories.id from categories where categories.lft >= parent_category.lft and categories.rgt <= parent_category.rgt)
                where newsletter_sources.source_type = 1 and leads.type = 'Lead' and leads.email_address <> '' and leads.contact_name <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, 'User' as subscriber_type, users.id as subscriber_id, users.email, users.first_name||' '||users.last_name as name, users.company_name as company_name, addresses.zip_code as zip_code, company_ean_number, vat_number as company_vat_no, title as contact_title, address_line_1, address_line_2, address_line_3, direct_phone_number, phone, region_id, country_id, pnumber, nnmid, custom_1, custom_2, custom_3, custom_4, custom_5
                from newsletter_sources
                inner join subscriptions on subscriptions.subscription_plan_id = newsletter_sources.sourceable_id
                inner join users on users.id = subscriptions.user_id
                left join addresses on addresses.addressable_id = users.id and addresses.addressable_type ~ 'User'
                where newsletter_sources.source_type = 3 and users.first_name||' '||users.last_name <> '' and users.email <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, 'User' as subscriber_type, users.id as subscriber_id, users.email, users.first_name||' '||users.last_name as name, users.company_name as company_name, addresses.zip_code as zip_code, company_ean_number, vat_number as company_vat_no, title as contact_title, address_line_1, address_line_2, address_line_3, direct_phone_number, phone, region_id, country_id, pnumber, nnmid, custom_1, custom_2, custom_3, custom_4, custom_5
                from newsletter_sources
                inner join users on (users.roles_mask::bit(32) & (2^newsletter_sources.sourceable_id)::integer::bit(32))::integer <> 0
                left join addresses on addresses.addressable_id = users.id and addresses.addressable_type ~ 'User'
                where newsletter_sources.source_type = 2 and users.first_name||' '||users.last_name <> '' and users.email <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, newsletter_sources.sourceable_type as subscriber_type, newsletter_sources.sourceable_id as subscriber_id, leads.email_address, leads.contact_name as name, leads.company_name as company_name, leads.zip_code as zip_code, company_ean_number, null, null, address_line_1, address_line_2, address_line_3, direct_phone_number, null, region_id, country_id, pnumber, nnmid, custom_1, custom_2, custom_3, custom_4, custom_5
                from newsletter_sources
                inner join leads on leads.id = newsletter_sources.sourceable_id
                where newsletter_sources.source_type = 5 and newsletter_sources.sourceable_type = 'AbstractLead' and leads.email_address <> '' and leads.contact_name <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, newsletter_sources.sourceable_type as subscriber_type, newsletter_sources.sourceable_id as subscriber_id, users.email, users.first_name||' '||users.last_name as name, users.company_name as company_name, addresses.zip_code as zip_code, company_ean_number, vat_number as company_vat_no, title as contact_title, address_line_1, address_line_2, address_line_3, direct_phone_number, phone, region_id, country_id, pnumber, nnmid, custom_1, custom_2, custom_3, custom_4, custom_5
                from newsletter_sources
                inner join users on users.id = newsletter_sources.sourceable_id
                left join addresses on addresses.addressable_id = users.id and addresses.addressable_type ~ 'User'
                where newsletter_sources.source_type = 5 and newsletter_sources.sourceable_type = 'User' and users.first_name||' '||users.last_name <> '' and users.email <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, newsletter_tag_subscribers.subscriber_type as subscriber_type, newsletter_tag_subscribers.subscriber_id as subscriber_id, newsletter_tag_subscribers.email_address as email, newsletter_tag_subscribers.name as name, newsletter_tag_subscribers.company_name, newsletter_tag_subscribers.zip_code, company_ean_number, vat_number as company_vat_no, title as contact_title, address_line_1, address_line_2, address_line_3, direct_phone_number, phone, region_id, country_id, pnumber, nnmid, custom_1, custom_2, custom_3, custom_4, custom_5
                from newsletter_sources
                inner join newsletter_tag_subscribers on newsletter_tag_subscribers.newsletter_source_id = newsletter_sources.id
                inner join users u on newsletter_tag_subscribers.subscriber_id = u.id AND newsletter_tag_subscribers.subscriber_type = 'User'
                left join addresses a on a.addressable_id = u.id and a.addressable_type ~ 'User'
                where newsletter_sources.source_type = 4 and newsletter_tag_subscribers.email_address <> '' and newsletter_tag_subscribers.name <> ''
      }
  end

  def self.down
    execute %{
            DROP VIEW newsletter_subscribers;

            CREATE VIEW newsletter_subscribers AS
                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, 'Contact' as subscriber_type, leads.id as subscriber_id, leads.email_address, leads.contact_name as name, leads.company_name as company_name, leads.zip_code as zip_code, company_ean_number, null as company_vat_no, null as contact_title, address_line_1, address_line_2, address_line_3, direct_phone_number, null as phone, region_id, country_id
                from newsletter_sources
                inner join leads on leads.campaign_id = newsletter_sources.sourceable_id
                where newsletter_sources.source_type = 0 and leads.type = 'Contact' and leads.email_address <> '' and leads.contact_name <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, 'Lead' as subscriber_type, leads.id as subscriber_id, leads.email_address, leads.contact_name as name, leads.company_name as company_name, leads.zip_code as zip_code, company_ean_number, null, null, address_line_1, address_line_2, address_line_3, direct_phone_number, null, region_id, country_id
                from newsletter_sources
                inner join categories parent_category on parent_category.id = newsletter_sources.sourceable_id
                inner join leads on leads.category_id in (select categories.id from categories where categories.lft >= parent_category.lft and categories.rgt <= parent_category.rgt)
                where newsletter_sources.source_type = 1 and leads.type = 'Lead' and leads.email_address <> '' and leads.contact_name <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, 'User' as subscriber_type, users.id as subscriber_id, users.email, users.first_name||' '||users.last_name as name, users.company_name as company_name, addresses.zip_code as zip_code, company_ean_number, vat_number as company_vat_no, title as contact_title, address_line_1, address_line_2, address_line_3, direct_phone_number, phone, region_id, country_id
                from newsletter_sources
                inner join subscriptions on subscriptions.subscription_plan_id = newsletter_sources.sourceable_id
                inner join users on users.id = subscriptions.user_id
                left join addresses on addresses.addressable_id = users.id and addresses.addressable_type ~ 'User'
                where newsletter_sources.source_type = 3 and users.first_name||' '||users.last_name <> '' and users.email <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, 'User' as subscriber_type, users.id as subscriber_id, users.email, users.first_name||' '||users.last_name as name, users.company_name as company_name, addresses.zip_code as zip_code, company_ean_number, vat_number as company_vat_no, title as contact_title, address_line_1, address_line_2, address_line_3, direct_phone_number, phone, region_id, country_id
                from newsletter_sources
                inner join users on (users.roles_mask::bit(32) & (2^newsletter_sources.sourceable_id)::integer::bit(32))::integer <> 0
                left join addresses on addresses.addressable_id = users.id and addresses.addressable_type ~ 'User'
                where newsletter_sources.source_type = 2 and users.first_name||' '||users.last_name <> '' and users.email <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, newsletter_sources.sourceable_type as subscriber_type, newsletter_sources.sourceable_id as subscriber_id, leads.email_address, leads.contact_name as name, leads.company_name as company_name, leads.zip_code as zip_code, company_ean_number, null, null, address_line_1, address_line_2, address_line_3, direct_phone_number, null, region_id, country_id
                from newsletter_sources
                inner join leads on leads.id = newsletter_sources.sourceable_id
                where newsletter_sources.source_type = 5 and newsletter_sources.sourceable_type = 'AbstractLead' and leads.email_address <> '' and leads.contact_name <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, newsletter_sources.sourceable_type as subscriber_type, newsletter_sources.sourceable_id as subscriber_id, users.email, users.first_name||' '||users.last_name as name, users.company_name as company_name, addresses.zip_code as zip_code, company_ean_number, vat_number as company_vat_no, title as contact_title, address_line_1, address_line_2, address_line_3, direct_phone_number, phone, region_id, country_id
                from newsletter_sources
                inner join users on users.id = newsletter_sources.sourceable_id
                left join addresses on addresses.addressable_id = users.id and addresses.addressable_type ~ 'User'
                where newsletter_sources.source_type = 5 and newsletter_sources.sourceable_type = 'User' and users.first_name||' '||users.last_name <> '' and users.email <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, newsletter_tag_subscribers.subscriber_type as subscriber_type, newsletter_tag_subscribers.subscriber_id as subscriber_id, newsletter_tag_subscribers.email_address as email, newsletter_tag_subscribers.name as name, newsletter_tag_subscribers.company_name, newsletter_tag_subscribers.zip_code, company_ean_number, vat_number as company_vat_no, title as contact_title, address_line_1, address_line_2, address_line_3, direct_phone_number, phone, region_id, country_id
                from newsletter_sources
                inner join newsletter_tag_subscribers on newsletter_tag_subscribers.newsletter_source_id = newsletter_sources.id
                inner join users u on newsletter_tag_subscribers.subscriber_id = u.id AND newsletter_tag_subscribers.subscriber_type = 'User'
                left join addresses a on a.addressable_id = u.id and a.addressable_type ~ 'User'
                where newsletter_sources.source_type = 4 and newsletter_tag_subscribers.email_address <> '' and newsletter_tag_subscribers.name <> ''
      }
  end
end
