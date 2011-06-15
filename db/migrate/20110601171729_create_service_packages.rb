class CreateServicePackages < ActiveRecord::Migration
  def self.up
    create_table :service_packages do |t|
      t.string :title, :default => "package default title"
      t.string :urltitle, :default => "defurltitle"
      t.text :description, :default => "package default description"

      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at

      t.boolean :is_live, :default => "false"
      
      t.timestamps
    end
  end

  def self.down
    drop_table :service_packages
  end
end
