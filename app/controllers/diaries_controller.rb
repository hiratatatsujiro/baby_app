class DiariesController < ApplicationController
  def index
    @diaries = Diary.all
  end

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

    private
    def diary_params
      params.require(:diary).permit(:image, :title, :text, :date).merge(user_id: current_user.id)
    end
  end
end
