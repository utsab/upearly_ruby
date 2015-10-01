class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.integer :num_cheat_days
      t.integer :duration
      t.string :ref_email
      t.boolean :is_success
      t.string :readable_time
      t.integer :time_range
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
