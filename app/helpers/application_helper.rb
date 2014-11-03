module ApplicationHelper
  def tag2url(str)
    return str.gsub(" ", "_")
  end

  def url2tag(str)
    return str.gsub("_", " ")
  end
end
