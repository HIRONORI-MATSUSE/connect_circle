module ApplicationHelper



  def redirect_patient_session
    if current_user.patient.id != @user.patient.id
      flash[:notice] = "権限がありません"
      redirect_to patient_path(current_user.patient.id)
    end
  end

  def redirect_doctor_session
    if current_user.doctor.id != @user.doctor.id
      flash[:notice] = "権限がありません"
      redirect_to doctor_path(current_user.doctor.id)
    end
  end

  def doctor_admin_user
    if current_user.doctor.admin =! @user.doctor.id
      flash[:notice] = "権限がありません"
      redirect_to doctor_path(current_user.doctor.id) 
    end
  end

end
