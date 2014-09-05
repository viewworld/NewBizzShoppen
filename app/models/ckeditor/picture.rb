class Ckeditor::Picture < ::Asset
  self.table_name = 'assets'

  has_attached_file :data,
                    url: "/ckeditor/images/:id/:style_:basename.:extension",
                    path: ":rails_root/public/ckeditor/images/:id/:style_:basename.:extension",
	                  styles: { content: '575>', thumb: '80x80#' }

	validates_attachment_size :data, less_than: 2.megabytes
	validates_attachment_presence :data

	def url_content
	  url(:content)
	end

	# def url_thumb
	#   url(:thumb)
	# end
	#
	# def to_json(options = {})
	#   options[:methods] ||= []
	#   options[:methods] << :url_content
	#   options[:methods] << :url_thumb
	#   super options
  # end
end
