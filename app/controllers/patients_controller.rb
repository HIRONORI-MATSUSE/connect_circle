class PatientsController < ApplicationController
before_action :set_user, only: [:show, :edit, :update]

  def index
    
    @patients = current_user.doctor.clinic.reservation_patients
    #sortの返り値がarrayクラス
    # @patients = Patient.all.sort {|d1, d2| d1.name_kana[0].casecmp(d2.name_kana[0])}
    
     @patients = @patients.sort {|d1, d2| d1.name_kana[0].casecmp(d2.name_kana[0])}
    @patients = Patient.revive_active_record(@patients).page(params[:page]).per(10)
    if params[:patient].present?
      @patients = @patients.patient_name_search(params[:patient][:name_search]).page(params[:page]).per(10)
    end 
  end

  def show
  end

  def edit
    @user = User.find(params[:id])
    @email = @user.email
  end

  def update
    @patient = Patient.find(params[:id])
    @user = @patient.user
    if @user.update(user_params) && @patient.update(patient_params)
      redirect_to patient_path, notice: '編集しました'
    else
      render 'edit'
    end
  end

  private

  def set_user
    @patient = Patient.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:name, :name_kana, :gender, :birthday, :address, :phone_number, :image,:image_cache)
  end

  def user_params
    params.require(:patient).permit(:email, :password, :password_confirmation)
  end

end
