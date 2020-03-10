class UsersController < ApplicationController


	def index
		if params[:query].present?
		  sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
		  @users = User.where(sql_query, query: "%#{params[:query]}%")
		else
		  @users = User.all
		end
	end

	def show
		@user = User.find(params[:id])
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		@user.update(user_params)

		redirect_to user_path(@user) 
	end

	def destroy
    @user = User.find(params[:id])
    @user.destroy

    # no need for app/views/users/destroy.html.erb
    redirect_to users_path
	end

	private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :date_of_birth, :phone, :started, :weight, :weight_good, :reasons_for_weight, :active_member, :not_active_why, :belt, :last_promotion)
  end
end
