class PatientsController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]


  def show
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to admin_users_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

  private

  def set_user
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :name_kana, :gender, :birthday, :address, :phone_number, :image)
  end

end
