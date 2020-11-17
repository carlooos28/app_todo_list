class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :description
      t.date :initial_date
      t.date :final_date
      t.integer :status, default: 0
      t.integer :type_share_item, default: 0
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
