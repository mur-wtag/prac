class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.string :name
      t.string :public_name
      t.integer :type
      t.integer :pricing_policy

      t.timestamps
    end
  end
end
