class CreateTimers < ActiveRecord::Migration
  def change
    create_table :timers do |t|
      t.string :name
      t.integer :default
      t.integer :position
      t.boolean :visable
      t.string :color,  :default => "00f"

      t.timestamps
    end
  end
end
