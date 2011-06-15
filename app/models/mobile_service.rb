class MobileService < ActiveRecord::Base
  
  validates :title, :presence => true,
                    :length => { :minimum => 1 }, 
                    :uniqueness => true, 
                    :format => { :with => /[A-Za-z0-9\-\'\"\+\.\!\?\@\$\#\%\&\=\,\: ]+/ }

  validates :urltitle,  :presence => true,
                        :length => { :minimum => 1, :maximum => 16 }, 
                        :uniqueness => true,
                        :format => { :with => /[A-Za-z0-9\-\_]+/ }

  validates :description, :presence => true,
                          :length => { :minimum => 0 }

  validates_attachment_presence :icon

  validates :url,   :presence => true,
                    :length => { :minimum => 1 }, 
                    :uniqueness => true
  
  has_many :package_memberships
  has_many :service_packages, :through => :package_memberships

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

  default_scope order('title')
  scope :live, where({:is_live=>true}).order('title')
  scope :public, where({:is_live=>true,:is_restricted=>false}).order('title')
  
end
