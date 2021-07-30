class CreateDrinks < ActiveRecord::Migration[6.1]
  def change
    create_table :drinks do |t|
      t.string :name,unique: true
      t.string :shop
      t.string :image_id
      t.text :body
      t.timestamps
    end
  end
end
