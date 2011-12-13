class CreateServicePackages < ActiveRecord::Migration
  def self.up
    create_table :service_packages do |t|
      t.string :title, :default => ""
      t.string :urltitle, :default => ""
      t.text :description
      t.string :display_style, :default => "grid"

      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at

      t.boolean :is_live, :default => "false"
      t.boolean :is_restricted, :default => "false"
      t.boolean :flag_show_root_link, :default => "true"
      t.boolean :flag_show_description, :default => "false"
      
      t.timestamps
    end
  end

  def self.down
    drop_table :service_packages
  end
end
