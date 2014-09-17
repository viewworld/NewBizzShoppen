class SwapServiceCallResult < ActiveRecord::Migration
  def self.up
    result = Result.create(:name => 'Service call', :generic => true)
    result.result_fields.create(:name => 'Service call date', :field_type => 4)

    et_origin = EmailTemplate.where(:uniq_id => 'upgrade_contact_to_member', :resource_id => nil).first
    if et_origin
      et = et_origin.clone
      et.uniq_id = 'service_call'
      et.name = 'Upgrade contact to member through Service call'
      et.subject = 'You have been upgraded to member through Service call'
      et.save

      Campaign.all.each(&:save)
    end
  end

  def self.down
    Result.find_by_name('Service call').delete
    EmailTemplate.where(:uniq_id => 'service_call').delete_all
  end
end
