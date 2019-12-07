class PatientsController < ApplicationController

  def show
     @patinet = Patient.find(params[:id])
  end

  def edit
  end

  def update
  end

  private

  def patient_params
    params.require(:patient).permit(:name)
  end

end
