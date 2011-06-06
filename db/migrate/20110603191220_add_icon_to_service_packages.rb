class AddIconToServicePackages < ActiveRecord::Migration
  def self.up
    remove_column :service_packages, :icon
    add_column :service_packages, :icon_file_name, :string
    add_column :service_packages, :icon_content_type, :string
    add_column :service_packages, :icon_file_size, :integer
    add_column :service_packages, :icon_updated_at, :datetime
  end

  def self.down
    remove_column :service_packages, :icon_updated_at
    remove_column :service_packages, :icon_file_size
    remove_column :service_packages, :icon_content_type
    remove_column :service_packages, :icon_file_name
    add_column :service_packages, :icon, :string
  end
end
