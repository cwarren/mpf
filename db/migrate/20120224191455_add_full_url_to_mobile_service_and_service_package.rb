class AddFullUrlToMobileServiceAndServicePackage < ActiveRecord::Migration
  def change
    add_column :mobile_services, :full_site_url, :string
    add_column :service_packages, :full_site_url, :string
  end
end
