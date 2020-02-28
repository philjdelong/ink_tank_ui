class AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.select(:id, :date, :description).where(artist_id: params[:artist_id])
    @artist_id = params[:artist_id]
  end

  def show
    @appointment_date = params[:id]

    respond_to do |format|
      format.js { render layout: false }
    end
  end

  def create
    new_appointment = Appointment.new(appointment_params)
    artist = Artist.find(params[:artist_id])
    artist.appointments << new_appointment

    if new_appointment.save
      flash[:notice] = 'Appointment created successfully'
    else
      flash[:notice] = 'Appointment not saved please try again'
    end

    redirect_to artist_appointments_path(artist.id)
  end

  private

    def appointment_params
      params.permit(:date, :description)
    end
end
