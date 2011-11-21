module ApplicationHelper
  
  # render date
  def rdate(value)
    l value, :format => :dmy if value
  end
end
