module ApplicationHelper
  def is_active?(link_path)
    if current_page?(link_path)
      "active-link"
    else
      ""
    end
  end

  def page_title(title)
    title += " | " if title.present?
    title += "Mix & Go"
  end
end
