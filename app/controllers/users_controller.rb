class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update, :destroy]
 	
	def index
		if params[:query].present?
		  sql_query = "first_name ILIKE :query OR last_name ILIKE :query"
		  @users = policy_scope(User.where(sql_query, query: "%#{params[:query]}%"))
		else
		  @users = policy_scope(User).order(created_at: :desc)
		end
	end

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to user_path(@user),  notice: "Profile successfully updated"
		else
			render :edit
		end 
	end

	def destroy
    @user.destroy

    # no need for app/views/users/destroy.html.erb
    redirect_to root_path, notice: "Profile of #{user_name} successfully deleted"
	end

	# def impersonate
 #    user = User.find(params[:id])
 #    impersonate_user(user)
 #    redirect_to root_path
 #  end

 #  def stop_impersonating
 #    stop_impersonating_user
 #    redirect_to root_path
 #  end

  

	private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :date_of_birth, :phone, :started, :weight, :height, :weight_good, :reasons_for_weight, :active_member, :not_active_why, :belt, :last_promotion, :photo)
  end

  def set_user
  	@user = User.find(params[:id])
  	authorize @user
  end
end
