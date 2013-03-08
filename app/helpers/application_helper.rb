module ApplicationHelper
  def markdown(text)
    options = { :hard_wrap => true, :filter_html => true, :autolink => true, :no_intraemphasis => true, :fenced_code => true, :gh_blockcode => true }
    Redcarpet::Markdown.new(Redcarpet::Render::HTML, options).render(text).html_safe
  end
end
