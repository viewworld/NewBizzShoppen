module ApplicationHelper
  include ScopedSearch::Helpers

  class HelperBlocks
    attr_accessor :results

    def initialize(*names)
      @results = {}
      names.each do |name|
        @results["block_#{name}".to_sym] = nil
        eval <<-EOM
            def #{name.to_s}(&block)
              @results[:block_#{name}] = block
            end
        EOM
      end
    end
  end
  
  def link_to_add_fields(f)
     new_object = f.object.class.new
     fields = fields_for(new_object) do |builder|
       render("lead_fields", :f => builder)
     end
     "add_fields(this, \"#{escape_javascript(fields)}\")"
  end
end
