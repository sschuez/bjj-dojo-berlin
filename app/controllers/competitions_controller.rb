class CompetitionsController < ApplicationController

	def index
		@competitions = policy_scope(Competition)
		# authorize @competitions
	end

	def new
	end

	def create
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
		params.require(:promotion).permit(:name, :date, :location, :info, :registration_start, :registration_end)
	end
end