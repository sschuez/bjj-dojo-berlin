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
		
		if @competition.save
			redirect_to competition_path(@competition)
			flash[:notice] = "Created competition #{@competition.name.upcase}"
		else
			render :new
		end
	end

	def show
		@competition = Competition.find(params[:id])
		authorize @competition
	end

	def edit
		@competition = Competition.find(params[:id])
		authorize @competition
	end

	def update
		@competition = Competition.find(params[:id])
		authorize @competition

		if @competition.update(competition_params)
			redirect_to competition_path(@competition)
			flash[:notice] = "Updated competition #{@competition.name.upcase}"
		else
			render :edit
		end
	end

	def destroy
		@competition = Competition.find(params[:id])
		authorize @competition

		@competition.destroy

		redirect_to competitions_path
		flash[:notice] = "Deleted competition #{@competition.name.upcase}"
	end

	private

	def competition_params
		params.require(:competition).permit(:name, :website, :date, :location, :info, :registration_start, :registration_end, :photo)
	end
end