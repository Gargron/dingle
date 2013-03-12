module ApplicationHelper
  def markdown(text)
    @renderer ||= Redcarpet::Render::HTML.new(:filter_html => true, :no_images => true, :hard_wrap => true)
    @markdown ||= Redcarpet::Markdown.new(@renderer, :autolink => true, :no_intraemphasis => true)
    @markdown.render(text).html_safe
  end
end
