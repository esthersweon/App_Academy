class CreateCircleMemberships < ActiveRecord::Migration
  def change
    create_table :circle_memberships do |t|
      t.integer :member_id, null: false
      t.timestamps
    end
  end
end
