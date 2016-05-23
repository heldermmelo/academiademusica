class CreateVideos < ActiveRecord::Migration
  def change
    create_table :videos do |t|
      t.string :titulo
      t.date :criado_em
      t.text :descricao
      t.string :thumbnail_file_name
      t.datetime :thumbnail_updated_at
      t.boolean :published

      t.timestamps null: false
    end
  end
end
