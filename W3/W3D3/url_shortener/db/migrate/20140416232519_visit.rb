class Visit < ActiveRecord::Migration
  def change
    create_table :visits do |t|
      t.integer :visitor_id
      t.integer :visited_url_id

      t.timestamps
    end
  end
end
