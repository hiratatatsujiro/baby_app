class DiariesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: :show
  
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

    def move_to_index
      @diary = Diary.find(params[:id])
      unless user_signed_in? && current_user.id == @diary.user_id
        redirect_to root_path
      end
    end
  
end
