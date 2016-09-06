class CreateEmployees < ActiveRecord::Migration[5.0]
  def change
    create_table :employees do |t|
      t.string :name
      t.integer :role
      t.integer :age
      t.integer :gender
      t.string :phone
      t.text :address

      t.timestamps
    end
  end
end
