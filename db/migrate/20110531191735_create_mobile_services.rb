class CreateMobileServices < ActiveRecord::Migration
  def self.up
    create_table :mobile_services do |t|
      t.string :title, :default => "service default title"
      t.text :description, :default => "service default description"
      t.string :icon, :default => ""
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
