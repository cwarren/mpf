module ApplicationHelper

  def display_feed_service (ms)
    res = ""
    coder = HTMLEntities.new
    if (! ms.items.nil?)
      ms.items.each do |rsi|
        res += "<div id=\""+ms.urltitle+"_"+rsi.title.hash.to_s+"\" class=\"panel\">"
        res += "<h3>"+(coder.decode(rsi.title)).html_safe+"</h3><p>"
        if (! rsi.pubDate.nil?)
          res += "<span>"+rsi.pubDate.strftime("%D").html_safe+"</span><br/>"
        end
        if (! rsi.content_encoded.nil?)
          res += (coder.decode(rsi.content_encoded)).html_safe
        elsif (! rsi.description.nil?)
          res += (coder.decode(rsi.description)).html_safe
        else
          res += "no details available"
        end
        res += "</p></div>"
      end
    end
    return res
  end
  
end
