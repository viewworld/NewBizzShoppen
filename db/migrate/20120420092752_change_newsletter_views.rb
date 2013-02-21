class ChangeNewsletterViews < ActiveRecord::Migration
  def self.up
    execute %{
      create or replace view newsletter_tag_subscribers as
      select
        newsletter_sources.id as newsletter_source_id,
        newsletter_sources.newsletter_list_id,
        case
          when taggings.taggable_type ~ 'User' then 'User'
          when taggings.taggable_type ~ 'AbstractLead|Lead|Contact' then 'AbstractLead'
        end as subscriber_type,
        taggings.taggable_id as subscriber_id,
        case
          when taggings.taggable_type ~ 'User' then users.email
          when taggings.taggable_type ~ 'AbstractLead|Lead|Deal|Contact' then leads.email_address
        end as email_address,
        case
          when taggings.taggable_type ~ 'User' then users.first_name||' '||users.last_name
          when taggings.taggable_type ~ 'AbstractLead|Lead|Contact' then leads.contact_name
        end as name,
        case
          when taggings.taggable_type ~ 'User' then users.company_name
          when taggings.taggable_type ~ 'AbstractLead|Lead|Contact' then leads.company_name
        end as company_name,
        case
          when taggings.taggable_type ~ 'User' then addresses.zip_code
          when taggings.taggable_type ~ 'AbstractLead|Lead|Contact' then leads.zip_code
        end as zip_code,
        case
          when taggings.taggable_type ~ 'User' then users.login_key
          when taggings.taggable_type ~ 'AbstractLead|Lead|Contact' then NULL
        end as login_key
      from newsletter_sources
      inner join tag_groups on tag_groups.id = newsletter_sources.sourceable_id
      inner join taggings tag_group on tag_group.taggable_id = tag_groups.id and tag_group.taggable_type='TagGroup'
      inner join taggings on taggings.tag_id = tag_group.tag_id
      left join users on users.id = taggings.taggable_id
      left join addresses on addresses.addressable_id = users.id and addresses.addressable_type = taggings.taggable_type
      left join campaigns on campaigns.id = taggings.taggable_id
      left join leads on leads.id = taggings.taggable_id
      where taggings.taggable_type<>'TagGroup' and newsletter_sources.source_type = 4 and tag_groups.match_all is false
      group by newsletter_sources.id,newsletter_sources.newsletter_list_id,taggings.taggable_type,taggings.taggable_id,users.email,leads.email_address,users.first_name,users.last_name,leads.contact_name,leads.company_name,users.company_name,addresses.zip_code,leads.zip_code,users.login_key

      union all

      select
        newsletter_sources.id as newsletter_source_id,
        newsletter_sources.newsletter_list_id,
        case
          when taggings.taggable_type ~ 'User' then 'User'
          when taggings.taggable_type ~ 'AbstractLead|Lead|Contact' then 'AbstractLead'
        end as subscriber_type,
        taggings.taggable_id as subscriber_id,
        case
          when taggings.taggable_type ~ 'User' then users.email
          when taggings.taggable_type ~ 'AbstractLead|Lead|Deal|Contact' then leads.email_address
        end as email_address,
        case
          when taggings.taggable_type ~ 'User' then users.first_name||' '||users.last_name
          when taggings.taggable_type ~ 'AbstractLead|Lead|Contact' then leads.contact_name
        end as name,
        case
          when taggings.taggable_type ~ 'User' then users.company_name
          when taggings.taggable_type ~ 'AbstractLead|Lead|Contact' then leads.company_name
        end as company_name,
        case
          when taggings.taggable_type ~ 'User' then addresses.zip_code
          when taggings.taggable_type ~ 'AbstractLead|Lead|Contact' then leads.zip_code
        end as zip_code,
        case
          when taggings.taggable_type ~ 'User' then users.login_key
          when taggings.taggable_type ~ 'AbstractLead|Lead|Contact' then NULL
        end as login_key
      from newsletter_sources
      inner join tag_groups on tag_groups.id = newsletter_sources.sourceable_id
      inner join taggings tag_group on tag_group.taggable_id = tag_groups.id and tag_group.taggable_type='TagGroup'
      inner join taggings on taggings.tag_id = tag_group.tag_id
      left join users on users.id = taggings.taggable_id
      left join addresses on addresses.addressable_id = users.id and addresses.addressable_type = taggings.taggable_type
      left join campaigns on campaigns.id = taggings.taggable_id
      left join leads on leads.id = taggings.taggable_id
      where taggings.taggable_type<>'TagGroup' and newsletter_sources.source_type = 4 and tag_groups.match_all is true
      group by newsletter_sources.id, newsletter_sources.newsletter_list_id, newsletter_sources.sourceable_id, taggings.taggable_type,taggings.taggable_id,users.email,leads.email_address,users.first_name,users.last_name,leads.contact_name,users.company_name,leads.company_name,addresses.zip_code,leads.zip_code,users.login_key
      having count(*) = (select count(*) from taggings where taggable_type='TagGroup' and taggable_id=newsletter_sources.sourceable_id)
    }

    execute %{
            CREATE OR REPLACE VIEW newsletter_subscribers AS
                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, 'Contact' as subscriber_type, leads.id as subscriber_id, leads.email_address, leads.contact_name as name, leads.company_name as company_name, leads.zip_code as zip_code, NULL as login_key
                from newsletter_sources
                inner join leads on leads.campaign_id = newsletter_sources.sourceable_id
                where newsletter_sources.source_type = 0 and leads.type = 'Contact' and leads.email_address <> '' and leads.contact_name <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, 'Lead' as subscriber_type, leads.id as subscriber_id, leads.email_address, leads.contact_name as name, leads.company_name as company_name, leads.zip_code as zip_code, NULL as login_key
                from newsletter_sources
                inner join categories parent_category on parent_category.id = newsletter_sources.sourceable_id
                inner join leads on leads.category_id in (select categories.id from categories where categories.lft >= parent_category.lft and categories.rgt <= parent_category.rgt)
                where newsletter_sources.source_type = 1 and leads.type = 'Lead' and leads.email_address <> '' and leads.contact_name <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, 'User' as subscriber_type, users.id as subscriber_id, users.email, users.first_name||' '||users.last_name as name, users.company_name as company_name, addresses.zip_code as zip_code, users.login_key as login_key
                from newsletter_sources
                inner join subscriptions on subscriptions.subscription_plan_id = newsletter_sources.sourceable_id
                inner join users on users.id = subscriptions.user_id
                left join addresses on addresses.addressable_id = users.id and addresses.addressable_type ~ 'User'
                where newsletter_sources.source_type = 3 and users.first_name||' '||users.last_name <> '' and users.email <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, 'User' as subscriber_type, users.id as subscriber_id, users.email, users.first_name||' '||users.last_name as name, users.company_name as company_name, addresses.zip_code as zip_code, users.login_key as login_key
                from newsletter_sources
                inner join users on (users.roles_mask::bit(32) & (2^newsletter_sources.sourceable_id)::integer::bit(32))::integer <> 0
                left join addresses on addresses.addressable_id = users.id and addresses.addressable_type ~ 'User'
                where newsletter_sources.source_type = 2 and users.first_name||' '||users.last_name <> '' and users.email <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, newsletter_sources.sourceable_type as subscriber_type, newsletter_sources.sourceable_id as subscriber_id, leads.email_address, leads.contact_name as name, leads.company_name as company_name, leads.zip_code as zip_code, NULL as login_key
                from newsletter_sources
                inner join leads on leads.id = newsletter_sources.sourceable_id
                where newsletter_sources.source_type = 5 and newsletter_sources.sourceable_type = 'AbstractLead' and leads.email_address <> '' and leads.contact_name <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, newsletter_sources.sourceable_type as subscriber_type, newsletter_sources.sourceable_id as subscriber_id, users.email, users.first_name||' '||users.last_name as name, users.company_name as company_name, addresses.zip_code as zip_code, users.login_key as login_key
                from newsletter_sources
                inner join users on users.id = newsletter_sources.sourceable_id
                left join addresses on addresses.addressable_id = users.id and addresses.addressable_type ~ 'User'
                where newsletter_sources.source_type = 5 and newsletter_sources.sourceable_type = 'User' and users.first_name||' '||users.last_name <> '' and users.email <> ''

                union all

                select newsletter_sources.id as newsletter_source_id, newsletter_sources.newsletter_list_id, newsletter_tag_subscribers.subscriber_type as subscriber_type, newsletter_tag_subscribers.subscriber_id as subscriber_id, newsletter_tag_subscribers.email_address as email, newsletter_tag_subscribers.name as name, newsletter_tag_subscribers.company_name, newsletter_tag_subscribers.zip_code, newsletter_tag_subscribers.login_key
                from newsletter_sources
                inner join newsletter_tag_subscribers on newsletter_tag_subscribers.newsletter_source_id = newsletter_sources.id
                where newsletter_sources.source_type = 4 and newsletter_tag_subscribers.email_address <> '' and newsletter_tag_subscribers.name <> ''
      }
  end

  def self.down
  end
end
