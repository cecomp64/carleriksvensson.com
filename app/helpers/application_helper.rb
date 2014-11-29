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

  # Strip out and parse special tags of the form
  # [img id size orientation]
  # [link ...]
  def parse_post(post)
    if (!post.nil?)
      img_re = /\[img ([0-9]+)( (small|medium))?( (left|right))?\]/
      link_re = /\[link (\S+)\]/

      parsed = post
      img_matches = post.scan(img_re)

      # Outer array is number of times regex matched
      # Inner array is each group of a given match
      img_matches.each do |match|
        # Substitute one-by-one (not globally)
        img_id = match[0].to_i
        float = match[4] ? match[4] : "left"
        size = match[2] ? match[2] : "medium"

        if (Image.find_by(id: img_id) && Image.find_by(id: img_id).file && Image.find_by(id: img_id).file.url(:medium))
          parsed.sub!(img_re, link_to(image_tag(Image.find_by(id: img_id).file.url(size), style: "float: #{float}"), Image.find_by(id: img_id).file.url, target: "_new") )
        end
      end

      return parsed
    end
  end

end
