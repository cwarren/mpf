class CreatePackageMemberships < ActiveRecord::Migration
  def self.up
    create_table :package_memberships do |t|
      t.integer :mobile_service_id
      t.integer :service_package_id
      t.integer :ordering

      t.timestamps
    end
  end

  def self.down
    drop_table :package_memberships
  end
end
