class ServicePackage < ActiveRecord::Base

  validates :title, :presence => true,
                    :length => { :minimum => 1 }, 
                    :uniqueness => true, 
                    :format => { :with => /[A-Za-z0-9\-\'\"\+\.\!\?\@\$\#\%\&\=\,\: ]+/ }

  validates :urlname,  :presence => true,
                       :length => { :minimum => 1, :maximum => 16 }, 
                       :uniqueness => true,
                       :format => { :with => /[A-Za-z0-9\-\_]+/ }

  validates :description, :presence => true,
                          :length => { :minimum => 0 }

  validates :icon,  :presence => true,
                    :length => { :minimum => 1 }, 
                    :uniqueness => true

  has_and_belongs_to_many :mobile_services, :join_table => "package_memberships"
  
end
