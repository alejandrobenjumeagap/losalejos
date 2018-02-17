class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :first_name, null: false
      t.string :second_name
      t.string :first_last_name, null: false
      t.string :second_last_name
      t.string :email
      t.references :invite, foreign_key: true
      t.integer :rsvp, default: 0
      t.timestamps
    end
  end
end
