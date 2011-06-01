class MobileService < ActiveRecord::Base
  validates :title, :presence => true,
                    :length => { :minimum => 1 }, 
                    :uniqueness => true, 
                    :format => { :with => /[A-Za-z0-9\-\'\"\+\.\!\?\@\$\#\%\&\=\,\:]+/ }

end
