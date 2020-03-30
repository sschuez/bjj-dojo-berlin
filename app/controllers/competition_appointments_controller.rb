class CompetitionAppointmentsController < ApplicationController
	before_action :require_login

	def new
		@user = current_user
		@competition = Competition.find(params[:competition_id])
		@competition_appointment = CompetitionAppointment.new
		authorize @competition_appointment	
	end

	def create
		@user = current_user
		@competition = Competition.find(params[:competition_id])
		@competition_appointment = CompetitionAppointment.new(competition_appointment_params)
		authorize @competition_appointment

		@competition_appointment.user = @user
		@competition_appointment.competition = @competition
		@competition_appointment.save
		redirect_to competition_path(@competition)
		flash[:notice] = "Registered #{@user.first_name.upcase} #{@user.last_name.upcase} for #{@competition.name.upcase}"
	end

	def edit
		@user = CompetitionAppointment.find(params[:id]).user
		@competition = Competition.find(params[:competition_id])
		@competition_appointment = CompetitionAppointment.find(params[:id])
    authorize @competition_appointment
	end

	def update
		@user = CompetitionAppointment.find(params[:id]).user
		@competition = Competition.find(params[:competition_id])
		@competition_appointment = CompetitionAppointment.find(params[:id])
		authorize @competition_appointment

		if @competition_appointment.update(competition_appointment_params)
		  redirect_to competition_path(@competition)
		  flash[:notice] = "Edited registration for competition #{@competition.name.upcase}"
		else
		  render :edit
		end
	end


	private

	def require_login
    unless signed_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to new_user_session_path # halts request cycle
    end
  end

  def competition_appointment_params
  	params.require(:competition_appointment).permit(:weight_class, :belt_class, :result, :comment)
  end
end
