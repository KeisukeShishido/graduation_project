class CreatePoems < ActiveRecord::Migration[7.2]
  def change
    create_table :poems do |t|
      t.string :title
      t.string :aroma
      t.string :location
      t.text :content
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
