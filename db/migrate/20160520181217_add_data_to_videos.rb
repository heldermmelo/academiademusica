class AddDataToVideos < ActiveRecord::Migration
  def change
    add_column :videos, :data, :attachment
  end
end
