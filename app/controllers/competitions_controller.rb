class CompetitionsController < ApplicationController
	before_action :set_competition, only: [:show, :edit, :update, :destroy]
	
	def index
		@competitions = policy_scope(Competition).order(date: :asc)

		# @competitions = policy_scope(Competition).filter(params.slice(:date, :location, :registration_end))
		# @products = Product.filter(params.slice(:status, :location, :starts_with))		

		# @upcoming = policy_scope(Competition).pluck()
	end


	# if params[:query].present?
	#   sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
	#   @users = policy_scope(User.where(sql_query, query: "%#{params[:query]}%"))
	# else
	#   @users = policy_scope(User.order(sort_column + " " + sort_direction))
	#   # @promotions = policy_scope(Promotion.order(sort_column + " " + sort_direction))
		
	#   # filters
	# 	@sex = User.all.pluck(:sex).uniq
	# 	@active = User.all.pluck(:active_member).uniq
	# 	@users = @users.where(sex: params[:filter_sex]) if params[:filter_sex].present?
	# 	@users = @users.where(active_member: params[:filter_active_member]) if params[:filter_active_member].present?
	# end




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