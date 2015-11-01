class ChangeNotesToText < ActiveRecord::Migration
  def change
    change_column :events, :notes, :text
  end
end
