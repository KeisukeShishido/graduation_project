module ApplicationHelper
  def flash_message_color(type)
    case type.to_sym
    when :notice
      "bg-green-300 text-green-600 border border-green-500"
    when :alert
      "bg-red-200 text-red-600 border border-red-500"
    else
      "bg-gray-200 text-gray-600 border border-gray-400"
    end
  end
end
