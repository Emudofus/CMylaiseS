class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.references :account

      t.timestamps
    end
    add_index :articles, :account_id
  end
end
