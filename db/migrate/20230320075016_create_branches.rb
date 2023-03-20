class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches, id: :uuid do |t|
      t.string :name,null: false
      t.string :phone_number
      t.string :email
      t.belongs_to :store,foreign_key:true,null: false,type: :uuid
      t.belongs_to :provice,foreign_key: true,type: :uuid
      t.belongs_to :district,foreign_key: true,type: :uuid
      t.belongs_to :ward,foreign_key: true,type: :uuid
      t.string :detail_address
      t.uuid :admin_user_id,null: false
      t.timestamps
    end
    add_foreign_key "branches", "users",column: "admin_user_id"
  end
end
