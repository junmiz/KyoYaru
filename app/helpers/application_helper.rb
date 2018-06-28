module ApplicationHelper
  def full_title(page_title)
    base_title = "KyoYaru"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  def bootstrap_class(flash_type)
    case flash_type
      when "alert"
        "alert-warning"
      when "notice"
        "alert-info"
      else
        flash_type.to_s
    end
  end
end
