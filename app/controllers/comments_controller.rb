class CommentsController < ApplicationController
  def create
    @diary = Diary.find(params[:diary_id])
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      render json:{comment: @comment, user_name: current_user.name}
    else
      @diary = Diary.find(params[:diary_id])
      @comment = Comment.new(comment_params)
      @comments = @diary.comments
      render "diaries/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, diary_id: params[:diary_id])
  end
end
