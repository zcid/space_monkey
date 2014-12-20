class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :desription
      t.string :product
      t.string :user

      t.timestamps
    end
  end
end
