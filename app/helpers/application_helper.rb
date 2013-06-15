module ApplicationHelper

  def render_json_template(template)
    render(template: template, formats: 'json').html_safe
  end

end
