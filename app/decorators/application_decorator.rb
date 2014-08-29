class ApplicationDecorator < Draper::Decorator
  delegate_all
  delegate :raw, :link_to, :t, to: :h

  def self.collection_decorator_class
    PaginationDecorator
  end
end
