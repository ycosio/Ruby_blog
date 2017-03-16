class CommentsController < ApplicationController

  before_action :authenticate_user! , except: [:index, :show]
  #before_action :set_post

  def index
    @comments = comment.all
  end

  def create
    commentable = context
   @comment = commentable.comments.build(comment_params)
    @comment.user = current_user
   @comment.post = @post
   @comment.save
   redirect_to @post
  end

  def edit
    @comment = comment.find(params[:id])
  end

  def update
    @comment = comment.find(params[:id])
    @comment.update(comment_params)
    redirect_to @comment
  end

  def show
    @comment = comment.find(params[:id])
  end

  def destroy
    @comment = comment.find(params[:id])
    @comment.destroy
    redirect_to comments_path
  end

  private
    def comment_params
      params.require(:comment).permit(:content)
    end

    def context
      if params[:comment_id]
        com = Comment.find(params[:comment_id])
        @post = Post.find(com.post_id)
        com
      else
        @post =  Post.find(params[:post_id])
        @post
      end
    end

  def set_post
    @post = Post.find(params[:post_id])
  end
end
