class Remove < ActiveRecord::Migration
  def change
  	remove_column :projects, :course
  end
end
