class User::PatientController < ApplicationController
  def index
    @clinics = Clinic.all
  end

end
