class CreateNewsletterTagSubscribers < ActiveRecord::Migration
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
        end as zip_code
      from newsletter_sources
      inner join tag_groups on tag_groups.id = newsletter_sources.sourceable_id
      inner join taggings tag_group on tag_group.taggable_id = tag_groups.id and tag_group.taggable_type='TagGroup'
      inner join taggings on taggings.tag_id = tag_group.tag_id
      left join users on users.id = taggings.taggable_id
      left join addresses on addresses.addressable_id = users.id and addresses.addressable_type = taggings.taggable_type
      left join campaigns on campaigns.id = taggings.taggable_id
      left join leads on leads.id = taggings.taggable_id
      where taggings.taggable_type<>'TagGroup' and newsletter_sources.source_type = 4 and tag_groups.match_all is false
      group by newsletter_sources.id,newsletter_sources.newsletter_list_id,taggings.taggable_type,taggings.taggable_id,users.email,leads.email_address,users.first_name,users.last_name,leads.contact_name,leads.company_name,users.company_name,addresses.zip_code,leads.zip_code

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
        end as zip_code
      from newsletter_sources
      inner join tag_groups on tag_groups.id = newsletter_sources.sourceable_id
      inner join taggings tag_group on tag_group.taggable_id = tag_groups.id and tag_group.taggable_type='TagGroup'
      inner join taggings on taggings.tag_id = tag_group.tag_id
      left join users on users.id = taggings.taggable_id
      left join addresses on addresses.addressable_id = users.id and addresses.addressable_type = taggings.taggable_type
      left join campaigns on campaigns.id = taggings.taggable_id
      left join leads on leads.id = taggings.taggable_id
      where taggings.taggable_type<>'TagGroup' and newsletter_sources.source_type = 4 and tag_groups.match_all is true
      group by newsletter_sources.id, newsletter_sources.newsletter_list_id, newsletter_sources.sourceable_id, taggings.taggable_type,taggings.taggable_id,users.email,leads.email_address,users.first_name,users.last_name,leads.contact_name,users.company_name,leads.company_name,addresses.zip_code,leads.zip_code
      having count(*) = (select count(*) from taggings where taggable_type='TagGroup' and taggable_id=newsletter_sources.sourceable_id)
    }
  end

  def self.down
  end
end
