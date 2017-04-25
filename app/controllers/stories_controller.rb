class StoriesController < ApplicationController
  
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :destroy_user_if_current_user, only: %i[index show]
  
  def index
    @stories = Story.where(locale: I18n.locale)
    policy_scope(Story)
  end

  def show
    @story = Story.friendly.find(params[:id])
    authorize @story
    if @story.youtube
      @video = youtube_embed(@story.youtube)
    end 
  end

  private

  def story_params
    params.require(:story).permit(:title, :description, :locale, :photo, :photo_cache)
  end
  
  def youtube_embed(youtube_url)
    if youtube_url[/youtu\.be\/([^\?]*)/]
      youtube_id = $1
    else
      # Regex from # http://stackoverflow.com/questions/3452546/javascript-regex-how-to-get-youtube-video-id-from-url/4811367#4811367
      youtube_url[/^.*((v\/)|(embed\/)|(watch\?))\??v?=?([^\&\?]*).*/]
      youtube_id = $5
    end

    %Q{<iframe title="YouTube video player" width="640" height="390" src="http://www.youtube.com/embed/#{ youtube_id }" frameborder="0" allowfullscreen></iframe>}
  end
    
end