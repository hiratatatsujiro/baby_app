class CommentsController < ApplicationController
  def create
    @diary = Diary.find(params[:diary_id])
    @comment = Comment.new(comment_params)
    if @comment.valid?
      @comment.save
      redirect_to diary_path(@diary)
    else
      @diary = Diary.find(params[:diary_id])
      @comment = Comment.new(comment_params)
      render "diaries/show"
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, diary_id: params[:diary_id])
  end
end
