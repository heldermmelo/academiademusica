
class VideosController < ApplicationController
 #before_action :log_in
  #before_action :set_video, only: [:show, :edit, :like, :dislike]
wrap_parameters :video, include: [:id, :titulo, :criado_em, :descricao, :thumbnail_file_name, :thumbnail_updated_at, :published, :created_at, :updated_at, :data, :usuarios_videos_id, :data_file_name, :data_content_type, :data_file_size, :data_updated_at]


  # All published videos
  def index
    @videos = @Usuario.videos
      end

  def show
	@video=Video.find(params[:id])

	render stream:true

  end

  def new
	 
     @video = Video.new
         flash[:notice] = 'Video was saved.'
   
  end

  def edit
  end

  def create
    @video = Video.create(video_params)

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
# POST /upload
  # POST /upload.json
  def upload
    @video = Video.new(video_params)
		
    respond_to do |format|
      if @video.save
        format.html { redirect_to @video, notice: 'Usuario was successfully created.' }
        format.json { render :show, status: :created, location: @video }
      else
        format.html { render :new }
        format.json { render json: @video.errors, status: :unprocessable_entity }
      end
    end
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
    params.require(:video).permit(:id, :titulo, :criado_em, :descricao, :thumbnail_file_name, :thumbnail_updated_at, :published, :created_at, :updated_at, :data, :usuarios_videos_id, :data_file_name, :data_content_type, :data_file_size, :data_updated_at)
  end
  

end
