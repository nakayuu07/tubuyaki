class ArticlesController < ApplicationController
    
    before_action :set_article, only: [:edit, :update, :destroy]


   def index
     @articles = Article.all
   end
  
   def new
     if params[:back]
      @article = Article.new(articles_params)
    else
      @article = Article.new
    end
   end
  
   def create
    @article = Article.new(articles_params)
     if@article.save
      redirect_to articles_path,notice:"つぶやきを作成しました！"
     else
      render 'new'
     end
   end
   
   def edit
   end
   
   def update
     if @article.update(articles_params)
      redirect_to articles_path
     else
      render 'edit'
     end
   end
  
   def destroy
     @article.destroy
     redirect_to articles_path,notice:"つぶやきを削除しました"
   end
   
   def confirm
    @article= Article.new(articles_params)
     render :new if @blog.invalid?
   end
   
   private
    def articles_params
     params.require(:article).permit(:content)
    end
    
    def set_article
     @article = Article.find(params[:id])
    end
end


