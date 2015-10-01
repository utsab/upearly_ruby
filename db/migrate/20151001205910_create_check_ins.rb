class CreateCheckIns < ActiveRecord::Migration
  def change
    create_table :check_ins do |t|

      t.datetime :earliest_possible_checkin_time
      t.datetime :latest_possible_checkin_time
      t.boolean :is_success
      t.boolean :is_reconciled

      t.references :commitment, index:true, foreign_key: true

      t.timestamps null: false
    end
  end
end
