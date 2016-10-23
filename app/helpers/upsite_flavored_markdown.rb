class UpsiteFlavoredMarkdown < Redcarpet::Render::HTML
  def preprocess(document)
    r = Redcarpet::Markdown.new(self, options = {
      :markdown => true,
      :fenced_code_blocks           => true,
      :no_intra_emphasis            => true,
      :tables                       => true,
      :autolink                     => true,
      :disable_indented_code_blocks => true,
      :quote                        => true,
      :lax_spacing                  => true
    })

    # Render all of our custom markdown elements
    res = document
    res = space_block(res, r)
    res
  end

  def block_quote(text)
    r = Redcarpet::Markdown.new(Redcarpet::Render::HTML)
    "<div class='block block-text'>
      <div class='block-content'>
        #{r.render text}
      </div>
    </div>"
  end

  def image(link, title, alt_text)
    "<div class='block block-embed'>
      <a data-embed href='#{link}'></a>
      #{title.present? ? "<div class='block-caption'>#{title}</div>" : ''}
    </div>"
  end

  def space_block(document, renderer)
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
