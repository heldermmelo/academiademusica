module Paperclip
  class Attachment
    Paperclip::Attachment.interpolations[:content_type_extension] = proc do |attachment, style_name|
  case
    when ((style = attachment.styles[style_name]) && !style[:format].blank?) then style[:format]
    when attachment.instance.video? && style_name.to_s != 'original' then 'jpg'
  else
    File.extname(attachment.original_filename).gsub(/^\.+/, "")
  end
end
 {  :small => '36x36#',
                    :medium => '72x72#',
                    :large => '115x115#' },
                    :url => '/:class/:id/:style.:content_type_extension',
                    :path => ':rails_root/assets/:id_partition/:style.:content_type_extension',
                    :processors => lambda { |a| a.video? ? [:video_thumbnail] : [:thumbnail] }

  def video?
    [ 'application/x-mp4',
      'video/mpeg',
      'video/quicktime',
      'video/x-la-asf',
      'video/x-ms-asf',
      'video/x-msvideo',
      'video/x-sgi-movie',
      'video/x-flv',
      'flv-application/octet-stream',
      'video/3gpp',
      'video/3gpp2',
      'video/3gpp-tt',
      'video/BMPEG',
      'video/BT656',
      'video/CelB',
      'video/DV',
      'video/H261',
      'video/H263',
      'video/H263-1998',
      'video/H263-2000',
      'video/H264',
      'video/JPEG',
      'video/MJ2',
      'video/MP1S',
      'video/MP2P',
      'video/MP2T',
      'video/mp4',
      'video/MP4V-ES',
      'video/MPV',
      'video/mpeg4',
      'video/mpeg4-generic',
      'video/nv',
      'video/ogg',
      'video/parityfec',
      'video/pointer',
      'video/raw',
      'video/rtx' ].include?(asset.content_type)
  end
	def interpolations
	end

end
