class CommentsController < ApplicationController

    def create
    @blog = Blog.find(params[:blog_id])
    @comment = @blog.comments.build(comment_params)

    if @comment.save
        redirect_to blog_path(@blog)
    else
        logger.debug "================="
        logger.debug "hoge"
        logger.debug "================="
        render "blogs/show"
    end
    
    end

    
    private
        def comment_params
            params.require(:comment).permit(:commenter, :body)
        end







end
