class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
      t.string :type
      t.string :purpose
      t.string :color
      t.integer :watersensitivity
      t.integer :odorsensitivity
      t.integer :predictedlife
      t.integer :weight

      t.integer :usagetime
      t.integer :preference
      t.integer :frequency

      t.integer :user_id


      t.timestamps null: false
    end
  end
end
