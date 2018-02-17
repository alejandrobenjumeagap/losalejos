class CreateInvites < ActiveRecord::Migration[5.1]
  def change
    create_table :invites do |t|
      t.string :token, null: false
      t.string :tag, null: false
      t.timestamps
    end
  end
end
