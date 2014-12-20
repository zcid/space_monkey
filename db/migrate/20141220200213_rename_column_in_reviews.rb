class RenameColumnInReviews < ActiveRecord::Migration
  def change
  	rename_column :reviews, :desription, :description
  end
end
