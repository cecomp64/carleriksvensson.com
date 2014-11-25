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

  # Estimate the differe
  def date_distance_str(end_date, start_date)
    days = (end_date - start_date).to_i
    years = days / 365
    months = ((days.to_f - (365.to_f * years.to_f)) / 30.to_f).round
    str = "About "

    if (years > 0)
      str += "#{years} #{"year".pluralize(years)} "
    end

    if (months > 0)
      str += "#{months} #{"month".pluralize(months)} "
    end

    if (months == 0 && years == 0)
      str += "#{days} #{"day".pluralize(days)} "
    end

    return str
  end
end
