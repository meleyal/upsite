module ApplicationHelper
  def markdown(text)
    @markdown ||= Redcarpet::Markdown.new(Redcarpet::Render::HTML.new(with_toc_data: true), hard_wrap: true, autolink: true)
    @markdown.render(text).html_safe
  end

  def markdown_custom(text)
    @markdown_custom ||= Redcarpet::Markdown.new(UpsiteFlavoredMarkdown, {
      fenced_code_blocks: true,
      filter_html: true,
      escape_html: true
    })
    sanitize(@markdown_custom.render(text),
      tags: %w(div span h1 p a ul li strong em iframe img),
      attributes: %w(data-embed src style class href)
    )
  end

  def t_markdown(key, options = {})
    markdown t(key, options)
  end
end
