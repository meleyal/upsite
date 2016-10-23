module ApplicationHelper
  def markdown(text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(with_toc_data: true), hard_wrap: true, autolink: true)
    @markdown.render(text).html_safe
  end

  def markdown_custom(text)
    @markdown_custom ||= Redcarpet::Markdown.new(UpsiteFlavoredMarkdown, hard_wrap: true, autolink: true)
    @markdown_custom.render(text).html_safe
  end

  def t_markdown(key, options = {})
    markdown t(key, options)
  end
end
