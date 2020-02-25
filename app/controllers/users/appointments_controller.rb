class Users::AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.where(user_id: current_user.id)
  end

  def show
    @appointment_date = params[:id]
    @appointments = Appointment.where(date: @appointment_date)
    @appointment = Appointment.new

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def create
    new_appointment = Appointment.new(appointment_params)
    user = current_user
    user.appointments << new_appointment

    if new_appointment.save
      flash[:notice] = 'Appointment created successfully'
    else
      flash[:notice] = 'Appointment not saved please try again'
    end

    redirect_to users_appointments_path
  end

  def edit
    @appointment = Appointment.find(params[:id])

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def update
    appointment = Appointment.find(params[:id])

    if appointment.update(appointment_params)
      flash[:notice] = 'Appointment updated'
    else
      flash[:notice] = 'Appointment not updated, please try again'
    end

    redirect_to users_appointments_path
  end

  def destroy
    Appointment.destroy(params[:id])

    flash[:notice] = 'Appointment deleted'

    redirect_to users_appointments_path
  end

  private

    def appointment_params
      params.permit(:date, :description)
    end
end
