class DiariesController < ApplicationController
  
  def new
    @diary = Diary.new
  end

  def create
    @diary = Diary.new(diary_params)
    if @diary.valid?
      @diary.save
      redirect_to root_path
    else
      render :new
    end
  end


  def show
    @diary = Diary.find(params[:id])
    @comment = Comment.new
    @comments = @diary.comments
  end


    private
    def diary_params
      params.require(:diary).permit(:image, :title, :text, :day).merge(user_id: current_user.id)
    end
  
end
