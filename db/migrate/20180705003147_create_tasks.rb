class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.integer :userid
      t.text :content
      t.boolean :selected
      t.integer :order
      t.integer :status
      t.datetime :comp_date

      t.timestamps
    end
  end
end
