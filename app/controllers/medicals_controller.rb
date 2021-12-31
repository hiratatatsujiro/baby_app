class MedicalsController < ApplicationController

  def new
    @child = Child.find(params[:child_id])
    @medical = Medical.new
  end

  def create
    @child = Child.find(params[:child_id])
    @medical = Medical.new(medical_params)
    if @medical.valid?
      @medical.save
      redirect_to child_path(@child)
    else
      render :new
    end
  end

  def show
    @child = Child.find(params[:child_id])
    @medical = Medical.find(params[:id])
    @medical_comment = MedicalComment.new
    @medical_comments = @medical.medical_comments.order("created_at DESC")
  end

  private
  def medical_params
    params.require(:medical).permit(:day, :hospital, :drug_id, :name_id, :memo, {images: []}).merge(child_id: params[:child_id])
  end
end
