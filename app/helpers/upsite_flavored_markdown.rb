class UpsiteFlavoredMarkdown < Redcarpet::Render::HTML
  def preprocess(document)
    @renderer = Redcarpet::Markdown.new(self)
    # Render our custom markdown elements
    document = space_block(document)
    document
  end

  def header(text, heading_level)
    if heading_level == 1
      "<div class='page-header'>
        <h1 class='page-title'>
          #{text}
        </h1>
      </div>"
    else
      "<h#{heading_level}>#{text}</h#{heading_level}>"
    end
  end

  def block_code(code, language)
    "<div class='block block-text'>
      <div class='block-content'>
        #{@renderer.render code}
      </div>
    </div>"
  end

  def image(link, title, alt_text)
    "<div class='block block-embed'>
      <a data-embed href='#{link}'></a>
      #{alt_text.present? ? "<div class='block-caption'>#{alt_text}</div>" : ''}
    </div>"
  end

  def space_block(document)
    document.gsub(/^#\[(.*?)\]\((.*?)\)/m) do
      res = <<-eol
<div class="block block-space" style="background-color: #{$2};">
  #{$1.length > 0 ? "<div class='block-caption'>#{$1}</div>" : ''}
</div>
      eol
      res
    end
  end
end
