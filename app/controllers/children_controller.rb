class ChildrenController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :move_to_index, only: :show

  def index
    @children = Child.all
    @diaries = Diary.all
  end

  def new
    @child = Child.new
  end

  def create
    @child = Child.new(child_params)
    if @child.valid?
      @child.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @child = Child.find(params[:id])
    @medicals = @child.medicals
  end

  private
  def child_params
    params.require(:child).permit(:name, :image, :birthday, :gender_id).merge(user_id: current_user.id)
  end

  def move_to_index
    @child = Child.find(params[:id])
    unless user_signed_in? && current_user.id == @child.user_id
      redirect_to root_path
    end
  end

end
