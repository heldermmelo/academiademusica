class VisaoController < ApplicationController
	include ActionController::Live
	
   def send_data()
    
  	render :text => File.read('app/assets/video/video.m4v'), :content_type => 'video/mp4'
   end  
end
