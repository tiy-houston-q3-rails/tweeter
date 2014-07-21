class CreateFollowers < ActiveRecord::Migration
  def change
    create_table :followers do |t|
      t.references :user, null: false
      t.integer :them_id, null: false

      t.timestamps
    end
  end
end
