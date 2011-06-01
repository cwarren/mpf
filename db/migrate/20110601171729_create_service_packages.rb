class CreateServicePackages < ActiveRecord::Migration
  def self.up
    create_table :service_packages do |t|
      t.string :title, :default => "package default title"
      t.string :urlname, :default => "defurlname"
      t.text :description, :default => "package default description"
      t.string :icon, :default => ""
      t.boolean :is_live, :default => "false"
      
      t.timestamps
    end
  end

  def self.down
    drop_table :service_packages
  end
end
