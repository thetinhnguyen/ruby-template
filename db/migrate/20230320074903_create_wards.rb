class CreateWards < ActiveRecord::Migration[7.0]
  def change
    create_table :wards, id: :uuid do |t|
      t.string :name, null: false,index: { unique: true }
      t.belongs_to :district,null: false,foreign_key: true,type: :uuid
      t.timestamps
    end
  end
end
