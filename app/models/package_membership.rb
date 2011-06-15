class PackageMembership < ActiveRecord::Base

  belongs_to :service_package
  belongs_to :mobile_service
  
end
