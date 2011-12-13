class CreateMobileServices < ActiveRecord::Migration
  def self.up
    create_table :mobile_services do |t|
      t.string :title, :default => ""
      t.string :urltitle, :default => ""
      t.text :description, :default => ""
      t.string :service_type, :default => "embedded"

      t.string :icon_file_name
      t.string :icon_content_type
      t.integer :icon_file_size
      t.datetime :icon_updated_at

      t.string :url, :default => "", :null => false
      t.boolean :is_live, :default => "false"
      t.boolean :is_restricted, :default => "false"

      t.timestamps
    end
  end

  def self.down
    drop_table :mobile_services
  end
end
