module ApplicationHelper


  def is_number? string #Check if a string is numeric
    true if Float(string) rescue false
  end

end
