class CreateModels < ActiveRecord::Migration
  def change
    create_table :models do |t|
      t.string :name
      t.string :model_slug
      t.integer :organization_id

      t.timestamps
    end
  end
end
