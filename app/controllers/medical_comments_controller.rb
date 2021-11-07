class MedicalCommentsController < ApplicationController
  def create
    @child = Child.find(params[:child_id])
    @medical = Medical.find(params[:medical_id])
    @medical_comment = MedicalComment.new(medical_comment_params)
    if @medical_comment.valid?
      @medical_comment.save
      redirect_to child_medical_path(@medical.child, @medical)
    else
      render "medicals/show"
    end
  end
  private
  def medical_comment_params
    params.require(:medical_comment).permit(:content).merge(user_id: current_user.id, child_id: params[:child_id], medical_id: params[:medical_id])
  end
end
