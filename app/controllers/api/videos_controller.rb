class Api::VideosController < ApiController
  def index
    videos = Video.paginate(page: params[:page], per_page: params[:per_page])
    render json: {videos: videos}
  end
end