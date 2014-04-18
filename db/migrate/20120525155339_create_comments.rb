class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.references :account
      t.references :article

      t.timestamps
    end
    add_index :comments, :account_id
    add_index :comments, :article_id
  end
end
