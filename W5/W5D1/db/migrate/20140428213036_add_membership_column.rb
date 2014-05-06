class AddMembershipColumn < ActiveRecord::Migration
  def change
    add_column :circle_memberships, :circle_id, :integer
  end
end
