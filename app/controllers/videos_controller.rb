class VideosController < ApplicationController
 #before_action :log_in
  #before_action :set_video, only: [:show, :edit, :like, :dislike]

  # All published videos
  def index
    @videos = @usuarios_videos
    render stream:true
  end

  def show
  end

  def new
    def add
     @usuario = Usuario.find(session[:user_id])
     @video = Video.find(params[:id])
     @usuario.videos << @video
     flash[:notice] = 'Video was saved.'
   end
  end

  def edit
  end

  def create
    @video = Video.new

    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Video was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
  end

  # Likes video, increment likes count
  def like
    @video.like!
  end

  # Dislikes video, increment likes count
  def dislike
    @video.dislike!
  end
   def log_in(usuario)
	session[:usuario_id] = usuario.id
   end

  private

  def usuarios_videos
  	@usuario = Usuario.find(session[:usuario_id])
	@videos = Video.find(params[:id])
        @usuarios_videos = [@usuario, @videos]
  end
  def set_video
    @videos = Video.find(params[:id])
  end

  def video_params
    params.require(:video).permit(:id, :data, :titulo)
  end
end
