class Tag < ActsAsTaggableOn::Tag
  def count_taggings_by_type(*options)
    result = taggings

    result = result.where("taggable_type ~ ?", only.to_s) if only = options.delete(:only)
    result = result.where("taggable_type != ?", except.to_s) if except = options.delete(:except)

    result.count
  end
end
