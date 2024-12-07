class CreateApiKeys < ActiveRecord::Migration[8.1]
  def change
    create_table :api_keys do |t|
      t.references :bearer, polymorphic: true, null: false
      t.string :token_digest, null: false
      t.index :token_digest, unique: true
      t.timestamps
    end
  end
end
