class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.integer :giver_id
      t.integer :getter_id

      t.timestamps
    end
  end
end
