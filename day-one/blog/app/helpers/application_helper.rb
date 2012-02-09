module ApplicationHelper
  def title(text = nil)
    content_for :title, text
  end
end
