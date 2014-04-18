class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :ip
      t.integer :account_id
      t.string :type
      t.string :infos

      t.timestamps
    end
  end
end
