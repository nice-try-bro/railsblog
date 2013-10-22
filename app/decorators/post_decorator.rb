class PostDecorator < ApplicationDecorator
  delegate_all

  def preview_text
      h.truncate object.text
  end
end
