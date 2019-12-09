class Staff::InformationsController < ApplicationController

  def new
    @information = Information.new
  end

  def create
    @information = current_user.tasks.new(task_params)
    if @information.save
      redirect_to staff_clinic_path(current_user.doctor.clinic.id), notice: '作成しました'
    else
      render 'new'
    end
  end

end
