class CreateShareItemGroups < ActiveRecord::Migration[5.2]
  def change
    create_table :share_item_groups do |t|
      t.references :group, foreign_key: true
      t.references :task, foreign_key: true

      t.timestamps
    end
  end
end
