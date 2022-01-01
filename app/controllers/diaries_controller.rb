class DiariesController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: :show
  before_action :find_params, only: [:edit, :update, :show, :destroy]
  
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

  def edit
    
  end

  def update
    
    if @diary.valid?
      @diary.update(diary_params)
      @diary.save
      redirect_to diary_path(@diary)
    else
      render :edit
    end
  end


  def show
    
    @comment = Comment.new
    @comments = @diary.comments
  end

  def destroy
   
    @diary.destroy
    redirect_to root_path
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

    def find_params
      @diary = Diary.find(params[:id])
    end
  
end
