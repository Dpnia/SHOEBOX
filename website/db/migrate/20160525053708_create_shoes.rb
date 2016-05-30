class CreateShoes < ActiveRecord::Migration
  def change
    create_table :shoes do |t|
	    t.string :shoename

      t.string :shoetype
      t.string :purpose
      t.string :color
      t.integer :watersensitivity
      t.integer :odorsensitivity
      t.integer :predictedlife
      t.integer :weight
      t.integer :warmth

      t.integer :usagetime, default: 0, null: false
      t.integer :preference
      t.integer :frequency, default: 0, null: false

      t.boolean :jogging
      t.boolean :casual
      t.boolean :sports
      t.boolean :trip
      t.boolean :storll
      t.boolean :official
      t.boolean :date
      t.boolean :business
      t.boolean :soccer
      t.boolean :basketball
      t.boolean :house

      t.integer :user_id
      t.timestamps null: false
    end
  end
end
