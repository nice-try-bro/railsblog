class ApplicationDecorator < Draper::Decorator
  def self.collection_decorator_class
    PaginationDecorator
  end

  def created_at
    h.content_tag :span, :class => 'time' do
      h.l object.created_at, :format => :compact
    end
  end
end
