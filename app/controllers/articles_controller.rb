class ArticlesController < ApplicationController
  load_and_authorize_resource except: [:create]
  before_action :get_article, only: [:edit, :update, :show, :destroy]
  before_action :get_id_param, only: [:update, :destroy]
  before_action :authenticate_author!

  def index
    @articles = Article.page(params[:page]).per(3).order("id desc")
    @article = Article.new
  end

  def new
    @article = Article.new
  end

  def create
    author = AuthorService.new().get_author(params[:article][:author_id])
    @article = get_article_service.create_article(author, get_article_params)
    MailerJob.perform_later
    respond_to do |format|
       format.json {
        render :json => @article.to_json(:methods => [:image_url])
       }
    end
  end

  def edit
  end

  def update
    get_article_service.update_article(@article, get_article_params)
  end

  def show
    @comments = @article.comments
  end

  def destroy
    get_article_service.destroy_article(@article)
  end

  private
    def get_article_service
      article_service = ArticleService.new()
    end

    def get_article_params
      params.require(:article).permit(:name, :text, :image, :video)
    end

    def get_id_param
      @id = params[:id]
    end

    def get_article
      @article = get_article_service.get_article(params[:id])

      redirect_to root_url if @article.nil?
    end
end