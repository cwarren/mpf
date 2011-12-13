class PackageMembership < ActiveRecord::Base

  belongs_to :service_package
  belongs_to :package_item, :polymorphic => true
  
end
