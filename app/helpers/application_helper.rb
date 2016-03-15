module ApplicationHelper
  def markdown(text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML, hard_wrap: true, autolink: true)
    @markdown.render(text).html_safe
  end

  def t_markdown(key)
    markdown t(key)
  end
end
