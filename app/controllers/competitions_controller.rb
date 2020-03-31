class CompetitionsController < ApplicationController
	before_action :set_competition, only: [:show, :edit, :update, :destroy]
	
	def index
		@competitions = policy_scope(Competition)
	end

	def new
		@competition = Competition.new
		authorize @competition
	end

	def create
		@competition = Competition.new(competition_params)
		@competition.created_by = current_user.first_name + ' ' + current_user.last_name
		authorize @competition
		
		if @competition.save
			redirect_to competition_path(@competition)
			flash[:notice] = "Created competition #{@competition.name.upcase}"
		else
			render :new
		end
	end

	def show
	end

	def edit
	end

	def update
		if @competition.update(competition_params)
			redirect_to competition_path(@competition)
			flash[:notice] = "Updated competition #{@competition.name.upcase}"
		else
			render :edit
		end
	end

	def destroy
		@competition.destroy

		redirect_to competitions_path
		flash[:notice] = "Deleted competition #{@competition.name.upcase}"
	end

	private

	def set_competition
		@competition = Competition.find(params[:id])
		authorize @competition
	end

	def competition_params
		params.require(:competition).permit(:name, :create_by, :website, :date, :location, :info, :registration_start, :registration_end, :photo)
	end
end