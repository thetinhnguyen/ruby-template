class CreateVerificationCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :verification_codes, id: :uuid do |t|
      t.text :hash_code,null: false
      t.datetime :expiry_time,null: false
      t.integer :type,null: false
      t.integer :send_method,null: false
      t.string :mail_or_phone_to,null: false
      t.timestamps
    end
  end
end
