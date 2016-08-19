class CreateBorrowers < ActiveRecord::Migration[5.0]
  def change
    create_table :borrowers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.text :need_money
      t.text :description
      t.integer :amount_needed
      t.integer :raised

      t.timestamps
    end
  end
end
