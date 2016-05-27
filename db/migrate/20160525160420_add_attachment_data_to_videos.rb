class AddAttachmentDataToVideos < ActiveRecord::Migration
  def change
    change_table :videos do |t|
      t.attachment :data
     end
   end 

end
