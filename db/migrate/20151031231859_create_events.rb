class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :event
      t.date :eventdate
      t.date :notes

      t.timestamps null: false
    end
  end
end
