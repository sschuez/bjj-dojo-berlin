class CompetitionsController < ApplicationController

	def index
		@competitions = policy_scope(Competition)
	end

	def new
		@competition = Competition.new
		authorize @competition
	end

	def create
		
		@competition = Competition.new(competition_params)
		authorize @competition
		@competition.save

		redirect_to competitions_path
		flash[:notice] = "Created competition #{@competition.name.capitalize}"
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private

	def competition_params
		params.require(:competition).permit(:name, :date, :location, :info, :registration_start, :registration_end)
	end
end