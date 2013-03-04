module DeviseHelper
  def devise_error_messages1!
    unless resource.errors.empty?
      content_tag :p, :class => "alert alert-failure" do
        resource.errors.full_messages.map { |msg| msg + "<br />" }.join.html_safe
      end
    else
      return ""
    end
  end
end
