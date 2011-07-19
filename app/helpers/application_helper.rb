module ApplicationHelper
  # Return a title on a per-page basis.
  def titulo
    base_title = "Ruby on Rails Tutorial Sample App"
    if @titulo.nil?
      base_title
    else
      "#{base_title} | #{@titulo}"
    end
  end
end
