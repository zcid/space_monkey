class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      add_reference :products, :users, index: true
      t.integer :score

      t.timestamps
    end
  end
end
