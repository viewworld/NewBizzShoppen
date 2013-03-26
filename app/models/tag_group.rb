class TagGroup < ActiveRecord::Base
  acts_as_taggable

  acts_as_newsletter_source

  CSV_ATTRS = %w{ tags }

  def tagged_objects
    options = match_all? ?  {:match_all => true} : {:any => true}
    Contact.tagged_with(tag_list, options.clone) +
    Lead.tagged_with(tag_list, options.clone) +
    User::Supplier.tagged_with(tag_list, options.clone) +
    User::CategorySupplier.tagged_with(tag_list, options.clone) +
    User::Member.tagged_with(tag_list, options.clone)
  end

  def to_s
    tags
  end
end
