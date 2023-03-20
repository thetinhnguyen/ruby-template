class CreateStores < ActiveRecord::Migration[7.0]
  def change
    create_table :stores, id: :uuid do |t|
      t.string :name,null: false
      t.string :phone_number
      t.string :email
      t.uuid :admin_user_id,null: false
      t.timestamps
    end
    add_foreign_key "stores", "users",column: "admin_user_id"
  end
end
