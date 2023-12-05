class CreatePitches < ActiveRecord::Migration[7.0]
  def change
    create_table :pitches do |t|
      t.string :address
      t.string :name
      t.integer :user_id
      t.string :image

      t.timestamps
    end
  end
end
