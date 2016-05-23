class AdicionaRefUsuariosVideosAVideos < ActiveRecord::Migration
	def change
		add_reference :videos, :usuarios_videos, index: true, foreign_key: true
	end
end
  
