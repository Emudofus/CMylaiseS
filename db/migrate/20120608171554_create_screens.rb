class CreateScreens < ActiveRecord::Migration
  def change
    create_table :screens do |t|
      t.string :image

      t.timestamps
    end
  end
end
