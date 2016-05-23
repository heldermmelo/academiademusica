class RefereTabelaUsuariosVideos < ActiveRecord::Migration
  	def change
		add_reference :usuarios, :usuarios_videos, index: true, foreign_key: true
	end
end
