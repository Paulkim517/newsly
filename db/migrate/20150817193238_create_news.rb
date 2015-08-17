class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.string :body
      t.string :url

      t.timestamps null: false
    end
  end
end
