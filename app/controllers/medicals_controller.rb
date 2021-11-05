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
      @child = Child.find(params[:child_id])
      @medical = Medical.new(medical_params)
      render :new
    end
  end

  private
  def medical_params
    params.require(:medical).permit(:day, :image, :hospital, :drug_id, :name_id, :memo).merge(children_id: params[:child_id])
  end
end
