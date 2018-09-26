class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :image
      t.text :biography
      t.string :department
      t.references :authority, foreign_key: true, default: 3

      t.timestamps
    end
  end
end
