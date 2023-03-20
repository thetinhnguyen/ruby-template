class CreateDistricts < ActiveRecord::Migration[7.0]
  def change
    create_table :districts, id: :uuid do |t|
      t.string :name, null: false,index: { unique: true }
      t.belongs_to :provice,null: false,foreign_key: true,type: :uuid
      t.timestamps
    end
  end
end
