class CommentsController < ApplicationController
    def create
        @article = Article.find(params[:article_id])
        @comment = @article.comments.create(comment_params)
        if @comment.save
            # redirect_to root_path
            redirect_to article_path(@article)
        else
            render :template => "articles/show", status: :unprocessable_entity
        end
    end

    def index
        @comments = Comment.all
    end

    def destroy
        @article = Article.find(params[:article_id])
        @comment = Comment.find(params[:id])
        @comment.destroy
        redirect_to article_path(@article), status: :see_other
    end

    private 
    def comment_params
        params.require(:comment).permit(:commenter,:body,:status)
    end
end
