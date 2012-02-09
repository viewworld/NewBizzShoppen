class Ckeditor::Picture < ::Asset
  has_attached_file :asset, attachment_options.merge(:styles => { :content => '575>', :thumb => '80x80#' })
	
	validates_attachment_size :asset, :less_than=>2.megabytes
	
	def url_content
	  url(:content)
	end
	
	def url_thumb
	  url(:thumb)
	end
	
	def to_json(options = {})
	  options[:methods] ||= []
	  options[:methods] << :url_content
	  options[:methods] << :url_thumb
	  super options
  end
end
