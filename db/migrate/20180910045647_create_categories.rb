class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :title
      t.text :description
      t.integer :difficulty, default: 0

      t.timestamps
    end
  end
end
