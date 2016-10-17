class CreateReservations < ActiveRecord::Migration
  def change
    create_table :reservations do |t|
      t.references :dress_size, index: true, foreign_key: true
      t.date :delivery_on
      t.date :return_on

      t.timestamps null: false
    end
  end
end
