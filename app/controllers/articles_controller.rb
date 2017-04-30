class ArticlesController < ApplicationController
  
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :destroy_user_if_current_user, only: %i[index show]
  
  def index
    @articles = Article.where(locale: I18n.locale)
    policy_scope(Article)
  end

  def show
    @article = Article.friendly.find(params[:id])
    authorize @article
    if @article.youtube
      @video = YoutubeEmbed.youtube_embed(@article.youtube)
    end 
  end

  private

  def article_params
    params.require(:article).permit(:title, :description, :locale, :photo, :photo_cache)
  end
    
end