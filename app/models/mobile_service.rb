class MobileService < ActiveRecord::Base
  
  validates :title, :presence => true,
                    :length => { :minimum => 1 }, 
                    :uniqueness => true, 
                    :format => { :with => /[A-Za-z0-9\-\'\"\+\.\!\?\@\$\#\%\&\=\,\: ]+/ }

  validates :description, :presence => true,
                          :length => { :minimum => 0 }

#  validates :icon,  :presence => true,
#                    :length => { :minimum => 1 }, 
#                    :uniqueness => true

  validates_attachment_presence :icon

  validates :url,   :presence => true,
                    :length => { :minimum => 1 }, 
                    :uniqueness => true

  has_and_belongs_to_many :service_packages, :join_table => "package_memberships"
  
  has_attached_file :icon,
    :path => ":rails_root/public/data/:attachment_:class/:id/:style_:basename.:extension",
    :url => "/data/:attachment_:class/:id/:style_:basename.:extension",
    :styles => {
                :base     => "57x57#",
                :x2       => "114x114#",
                :small    => "29x29#",
                :small50  => "50x50#",
                :x2small  => "58x58#",
                :px72     => "72x72#"
                }

  scope :available, where('is_live=1')
  scope :public, where('is_live=1 and is_restricted=0')
  
end
