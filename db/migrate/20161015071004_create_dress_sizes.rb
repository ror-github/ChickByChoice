class CreateDressSizes < ActiveRecord::Migration
  def change
    create_table :dress_sizes do |t|
      t.references :dress, index: true, foreign_key: true
      t.integer :size

      t.timestamps null: false
    end
  end
end
