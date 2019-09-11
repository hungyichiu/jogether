class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :event_name
      t.integer :event_type
      t.date :apply_start
      t.date :apply_end
      t.decimal :fee
      t.integer :max_attend
      t.integer :min_attend
      t.date :event_start
      t.date :event_end
      t.string :event_pic
      t.integer :event_status


      t.timestamps
    end
  end
end
