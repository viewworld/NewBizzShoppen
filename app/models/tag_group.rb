class TagGroup < ActiveRecord::Base
  acts_as_taggable

  acts_as_newsletter_source

  CSV_ATTRS = %w{ tags }

  def tagged_objects
    options = match_all? ?  {:match_all => true} : {:any => true}
    Contact.tagged_with(tag_list, options.dup) +
    Lead.tagged_with(tag_list, options.dup) +
    User::Supplier.tagged_with(tag_list, options.dup) +
    User::CategorySupplier.tagged_with(tag_list, options.dup) +
    User::Member.tagged_with(tag_list, options.dup)
  end

  def to_s
    tags
  end
end
