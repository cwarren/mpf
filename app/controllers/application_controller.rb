require 'simple-rss'
require 'open-uri'
require 'cgi'
require 'htmlentities'

class ApplicationController < ActionController::Base
  protect_from_forgery

  def android_request?
      request.user_agent =~ /android/
  end
  helper_method :android_request?

  def ios_request?
      request.user_agent =~ /(iPhone OS|iPad)/
  end
  helper_method :ios_request?
  
  #-------------------------------------------------------------

  def process_feed_package_items(package_items)
    
    #logger.debug("\n--------------------------\n process_feed_package_items")

    if (package_items.empty?)
      return
    end
    
    #logger.debug("all items: "+package_items.inspect)
    
    package_items.each do |pi|

      logger.debug("given item: "+pi.inspect)

      if (pi.package_item_type == "MobileService")
        ms = pi.package_item      

        logger.debug("ms is: "+ms.inspect)

        process_if_feed(ms)
      elsif (pi.package_item_type == "ServicePackage")

        #logger.debug("\n***********\npi.package_item is: "+pi.package_item.inspect)
        #logger.debug("\n+++++++++++\npi.package_item.package_items is: "+pi.package_item.package_items.inspect)
        #logger.debug("\n***********\n")

        process_feed_package_items(pi.package_item.package_items)

      end # if item type == mobile service
    end
  end



  def process_if_feed(s)
    #logger.debug("process_if_feed for "+s.title)

    feed_frequency = 600 # 10 minutes
    # NOTE: the heavily hit pages will be re-generated every X (5?) minutes, so 
    # hopefully the feeds will never need refreshing at the point of user request

    if (s.service_type == "feed")

      cache_file = Rails.root.to_s+"/public/feed_cache/"+s.url.hash.to_s
       logger.debug "cache file is "+ cache_file
      freshen_cache = false
      feed_source = s.url
      if (File.exists?(cache_file))
        #logger.debug "there's an existing cache file"
        staleness = Time.now - File.ctime(cache_file)
        #logger.debug staleness.to_s+"\n"
        if (staleness < feed_frequency)
          logger.debug "using the cache"
          freshen_cache = false
          feed_source = cache_file
        else
          logger.debug "cache is old - get the live data"
          freshen_cache = true
          cfile = File.open(cache_file,"w")
        end
      else
        #logger.debug "create new cache file"
        freshen_cache = true
        cfile = File.new(cache_file,"w")
      end
      #logger.debug "feed source is "+feed_source
      
      #logger.debug "A: cfile file is "+ cfile

      begin
        rss = SimpleRSS.parse open(feed_source)
      rescue Exception => e
        logger.error "feed source was "+feed_source
        logger.error "  encountered problem: "+e.to_s
        begin
          if (feed_source == cache_file)
            rss = SimpleRSS.parse open(s.url)
            freshen_cache = true
            cfile = File.open(cache_file,"w")
          else
            rss = SimpleRSS.parse open(cache_file)
          end
        rescue Exception => e2
          freshen_cache = false
          logger.error "  encountered additional problem: "+e2.to_s
          rss = SimpleRSS.parse '<rss xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/" xmlns:slash="http://purl.org/rss/1.0/modules/slash/" xmlns:georss="http://www.georss.org/georss" xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" xmlns:media="http://search.yahoo.com/mrss/" version="2.0">
 <channel><title>Feed Problem</title><description/><link/>
  <item>
   <title>Feed Problem</title>
  <description>There was a problem with the feed</description>
  <pubDate>Mon, 14 Nov 2011 12:00:00 -0500</pubDate>
  <link/>
</item></channel></rss>'
        end
      end

      if (freshen_cache)
        logger.debug "freshening the cache"
        #cfile.puts rss.source.force_encoding("UTF-8")
        ##ic = Iconv.new('UTF-8//IGNORE', 'UTF-8')
        ##cfile.puts ic.iconv(rss.source + ' ')[0..-2]
        begin
          cfile.puts rss.source.encode('UTF-8', 'UTF-8', :invalid => :replace, :replace => 'X')
        rescue Exception => e
          cfile.puts '<rss xmlns:content="http://purl.org/rss/1.0/modules/content/" xmlns:wfw="http://wellformedweb.org/CommentAPI/" xmlns:dc="http://purl.org/dc/elements/1.1/" xmlns:atom="http://www.w3.org/2005/Atom" xmlns:sy="http://purl.org/rss/1.0/modules/syndication/" xmlns:slash="http://purl.org/rss/1.0/modules/slash/" xmlns:georss="http://www.georss.org/georss" xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#" xmlns:media="http://search.yahoo.com/mrss/" version="2.0">
 <channel><title>Feed Problem</title><description/><link/>
  <item>
   <title>Feed Problem</title>
  <description>There was a problem with the data in the feed</description>
  <pubDate>Mon, 14 Nov 2011 12:00:00 -0500</pubDate>
  <link/>
</item></channel></rss>'
        end
        #cfile.puts rss.source.encode('UTF-16', 'UTF-8', :invalid => :replace, :replace => '').encode('UTF-8', 'UTF-16')
        cfile.close
        rss = SimpleRSS.parse open(cache_file) # re-open from cache file to avoid Encoding::UndefinedConversionError from ASCII-8BIT to UTF-8
      end

      s.items = rss.items

    end # if service type == feed

  end
  
end
