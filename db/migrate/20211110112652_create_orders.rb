class CreateOrders < ActiveRecord::Migration[5.0]
  def change
    create_table :orders do |t|
      
      t.integer :custimer_id, null: false
      t.integer :method_of_payment, null: false
      t.integer :paymant_amount, null: false
      t.string :name, null: false
      t.string :address, null: false
      t.string :zip_code, null: false
      t.integer :status, null: false
      t.integer :postage, null: false

      t.timestamps
    end
  end
end
