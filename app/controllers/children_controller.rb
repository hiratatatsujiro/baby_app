class ChildrenController < ApplicationController
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
end
