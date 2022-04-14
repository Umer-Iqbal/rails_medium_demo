class CreateAdminTopicsLists < ActiveRecord::Migration[7.0]
  def change
    create_table :admin_topics_lists do |t|
      t.string :title
      t.text :description
      t.references :admin, null: false, foreign_key: true

      t.timestamps
    end
  end
end
