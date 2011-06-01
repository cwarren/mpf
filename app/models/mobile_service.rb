class MobileService < ActiveRecord::Base
  validates :title, :presence => true,
                    :length => { :minimum => 1 }, 
                    :uniqueness => true, 
                    :format => { :with => /[A-Za-z0-9\-\'\"\+\.\!\?\@\$\#\%\&\=\,\: ]+/ }

  validates :description, :presence => true,
                          :length => { :minimum => 0 }

  validates :icon,  :presence => true,
                    :length => { :minimum => 1 }, 
                    :uniqueness => true

  validates :url,  :presence => true,
                    :length => { :minimum => 1 }, 
                    :uniqueness => true

end
