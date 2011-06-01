class CreatePackageMemberships < ActiveRecord::Migration
  def self.up
    create_table :package_memberships, :id => false do |t|
      t.integer :mobile_service_id
      t.integer :service_package_id

      t.timestamps
    end
  end

  def self.down
    drop_table :package_memberships
  end
end
