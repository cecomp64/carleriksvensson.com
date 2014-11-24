module ApplicationHelper
  # Take a tag string and make it URL friendly
  # i.e. remove spaces
  def tag2url(str)
    return str.gsub(" ", "_")
  end

  # Convert from url form of tag to display form
  # of tags
  def url2tag(str)
    return str.gsub("_", " ")
  end

  # Find a tag within an object's list of tags
  def has_tag(tags, search_tag)
    tags.each do |tag|
      if (tag == search_tag)
        return true
      end
    end

    return false
  end

end
