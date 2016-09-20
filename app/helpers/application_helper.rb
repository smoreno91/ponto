module ApplicationHelper
    
  def title(page_title)
    content_for :title, page_title.to_s
  end
  
  def page_center
    content_for :html_class, "page-center"
    content_for :body_class, "page-center"
  end
end
