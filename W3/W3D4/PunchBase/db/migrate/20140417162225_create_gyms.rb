class CreateGyms < ActiveRecord::Migration
  def change
    create_table :gyms do |t|
      t.string :name, { :null => false }
      t.timestamps
    end
  end
end
