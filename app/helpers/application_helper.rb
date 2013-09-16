module ApplicationHelper
  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def date_format time
    time.strftime("%B, %d, %Y")
  end

  def markdown(text)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      fenced_code_blocks: true
    }
    Redcarpet::Markdown.new(renderer, options).render(text)
  end
end
