require 'unique_urltitle_validator'
    
class MobileService < ActiveRecord::Base
  
  attr_accessor :items
  
  validates :title, :presence => true,
                    :length => { :minimum => 1 }, 
                    #:uniqueness => true, # no uniqueness constraint on title - need dupes to support app recs for android and ios
                    :format => { :with => /[A-Za-z0-9\-\'\"\+\.\!\?\@\$\#\%\&\=\,\: ]+/ }

  validates :urltitle,  :presence => true,
                        :length => { :minimum => 1, :maximum => 32 }, 
                        :uniqueness => true,
                        :format => { :with => /[A-Za-z0-9\-\_]+/ },
                        :unique_urltitle => true

  validates :url,   :presence => true,
                    :length => { :minimum => 1 }, 
                    :uniqueness => true
  
  has_many :package_memberships,  :dependent => :destroy, :as => :package_item # contained in

  has_attached_file :icon,
    :path => ":rails_root/public/data/:attachment_:class/:id/:style_:basename.:extension",
    :url => "/data/:attachment_:class/:id/:style_:basename.:extension",
    :styles => {
                :base     => "57x57#",
                :x2       => "114x114#",
                :small16  => "16x16#",
                :small    => "29x29#",
                :small50  => "50x50#",
                :x2small  => "58x58#",
                :px72     => "72x72#"
                }
    
end
