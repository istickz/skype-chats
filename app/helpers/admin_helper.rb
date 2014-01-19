module AdminHelper

def root_path?
    current_page?(admin_root_path)
end
def nav_link(link_text, link_path)
  class_name = current_page?(link_path) ? 'active' : ''

  content_tag(:li, :class => class_name) do
    link_to link_text, link_path
  end
end


def is_active?(page_name)
  "active" if params[:action] == page_name
end

def title(page_title)
      content_for :title, page_title.to_s
end
# def  content_title
#      @content_title
# end

def  content_title(text)
     content_for :content_title, text.to_s
end

end
