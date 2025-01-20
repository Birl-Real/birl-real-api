class CreateGroupMemberships < ActiveRecord::Migration[7.1]
  def change
    create_table :group_memberships do |t|
      t.references :user, null: false, foreign_key: true
      t.references :challenge_group, null: false, foreign_key: true
      t.string :role

      t.timestamps
    end
  end
end
