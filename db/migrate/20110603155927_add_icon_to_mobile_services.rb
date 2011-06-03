class AddIconToMobileServices < ActiveRecord::Migration
  def self.up
    remove_column :mobile_services, :icon
    add_column :mobile_services, :icon_file_name, :string
    add_column :mobile_services, :icon_content_type, :string
    add_column :mobile_services, :icon_file_size, :integer
    add_column :mobile_services, :icon_updated_at, :datetime
  end

  def self.down
    remove_column :mobile_services, :icon_updated_at
    remove_column :mobile_services, :icon_file_size
    remove_column :mobile_services, :icon_content_type
    remove_column :mobile_services, :icon_file_name
    add_column :mobile_services, :icon, :string, :default => ""
  end
end
