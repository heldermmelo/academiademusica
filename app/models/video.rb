class Video < ActiveRecord::Base
#	self.primary_key = "video_id"
	
	has_attached_file :data,
  url: '/videos/:id/:style/:basename.:extension', # whatever you want
  styles: {
    poster: { size: '640x480', format: 'jpg' }, # this takes a snapshot of the video to have as your poster
    v_large_webm: { geometry: '640x480', format: 'webm' }, # your webm format
    v_large_mp4: { geometry: '640x480', format: 'mp4' }, # your mp4 format
    v_large_MOV: { geometry: '640x480', format: 'MOV' } # your mp4 format

  } , :processors => [:ffmpeg]

	has_many :usuarios_videos
	has_many :usuarios, :through => :usuarios_videos
	validates_attachment_presence :data
	validates_attachment_size :data, less_than: 100.megabytes # if you want a max file size
	validates_attachment_content_type :data, content_type: /\Avideo\/.*\Z/ # or you can specify individual content types you want to allow
	

  end
