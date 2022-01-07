class MedicalsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_child
  before_action :find_medical, only: [:show, :edit, :update, :destroy]


  def new 
    @medical = Medical.new
  end

  def create
    @medical = Medical.new(medical_params)
    if @medical.valid?
      @medical.save
      redirect_to child_path(@child)
    else
      render :new
    end
  end

  def show
    
    @medical_comment = MedicalComment.new
    @medical_comments = @medical.medical_comments.order("created_at DESC")
  end

  def edit
   
    @medical = Medical.find(params[:id])
  end

  def update
   
    @medical = Medical.find(params[:id])
    if @medical.valid?
      @medical.update(medical_params)
      redirect_to child_medical_path(@child)
    else
      @child = Child.find(params[:child_id])
      @medical = Medical.find(params[:id])
      render "edit"
    end
  end

  def destroy
   
    
    @medical.destroy
    redirect_to child_path(@child)
  end

  private
  def medical_params
    params.require(:medical).permit(:day, :hospital, :drug_id, :name_id, :memo, {images: []}).merge(child_id: params[:child_id])
  end

  def find_child
    @child = Child.find(params[:child_id])
  end

  def find_medical
    @medical = Medical.find(params[:id])
  end
end
