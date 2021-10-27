class ChildrenController < ApplicationController
  def index
    @children = Children.all
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
end
