class AddAcceptanceToUser < ActiveRecord::Migration
  def change
    add_column :users, :acceptance, :boolean
  end
end
