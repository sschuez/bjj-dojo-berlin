class CommentsController < ApplicationController
  
  def index
    @comments = current_user.comments
    # if params[:user_id] && @user = User.find_by_id(params[:user_id])
    #   @comments = User.find_by_id(params[:user_id]).comments
    # else
    #   @comments = Comment.order(:name)
    # end
    # respond_to do |format|
    #   format.html
    #   format.json {render json: @comments.tokens(params[:q]) }
    # end
  end

  def new
  end

  def create
    @comment = Comment.new(comment_params)
    # we need `user_id` to associate comment with corresponding user
    @user = User.find(params[:user_id])
    @comment.user = @user
    @comment.save
    redirect_to user_path(@user)
  end

  def show
  end

  def destroy
  end

  def update
  end

  private

  def comment_params
    params.require(:comment).permit(:category, :content)
  end
end
