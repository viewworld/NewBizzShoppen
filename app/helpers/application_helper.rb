module ApplicationHelper
  include ScopedSearch::Helpers

  def link_to_add_fields(f)
     new_object = f.object.class.new
     fields = fields_for(new_object) do |builder|
       render("lead_fields", :f => builder)
     end
     "add_fields(this, \"#{escape_javascript(fields)}\")"
  end
end
