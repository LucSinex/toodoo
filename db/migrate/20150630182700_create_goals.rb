class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.text :content
      t.boolean :done, :default => false
      t.integer :priority
      t.references :list, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
