class CreateReceptionists < ActiveRecord::Migration[7.0]
  def change
    create_table :receptionists, id: false do |t|
      t.belongs_to :branche,foreign_key: true,type: :uuid
      t.belongs_to :user,foreign_key: true,type: :uuid
      t.timestamps
    end
  end
end
