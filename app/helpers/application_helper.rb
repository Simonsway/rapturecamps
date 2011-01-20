module ApplicationHelper
  def error_messages_for obj
    messages = obj.errors.full_messages
    if messages.any?
      render :template => "/common/error_messages_for", :locals => {:messages => messages}
    end
  end
end
