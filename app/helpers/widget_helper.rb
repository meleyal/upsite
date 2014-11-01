module WidgetHelper
  def markdown(text)
    md = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    return md.render(text).html_safe
  end
end
