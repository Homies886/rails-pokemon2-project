class CreateCaptures < ActiveRecord::Migration[6.0]
  def change
    create_table :captures do |t|
      t.string :pokeball
      t.date :captured
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :pokemon, null: false, foreign_key: true

      t.timestamps
    end
  end
end
