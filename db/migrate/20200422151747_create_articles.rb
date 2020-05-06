class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :text
      t.datetime :time_creation
      t.string :created_by

      t.timestamps
    end
  end
end
