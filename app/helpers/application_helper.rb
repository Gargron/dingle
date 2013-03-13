module ApplicationHelper
  def markdown(text)
    @renderer ||= Redcarpet::Render::HTML.new(:filter_html => true, :no_images => true, :hard_wrap => true)
    @markdown ||= Redcarpet::Markdown.new(@renderer, :autolink => true, :no_intraemphasis => true)
    @markdown.render(text).html_safe
  end

  def title(page_title)
    content_for(:title) { page_title }
  end
end
