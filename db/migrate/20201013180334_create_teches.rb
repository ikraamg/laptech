class CreateTeches < ActiveRecord::Migration[6.0]
  def change
    create_table :teches do |t|
      t.string :title
      t.string :description
      t.string :category
      t.float :price
      t.float :cost
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
