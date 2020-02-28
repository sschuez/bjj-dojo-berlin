class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

	def age?
		((Time.zone.now - self.date_of_birth.to_time) / 1.year.seconds).floor         	
	end

	def member_since_months
		months = (Date.today.year - self.started.year) * 12 + Date.today.month - self.started.month - (Date.today.day >= self.started.day ? 0 : 1)
	end         

	def date_diff(date1,date2)
	  month = (date2.year * 12 + date2.month) - (date1.year * 12 + date1.month)
	  month_array = month.divmod(12)
	  if month_array[0] > 0
	  	"#{month_array[0]}y #{month_array[1]}m"
	  else
	  	"#{month_array[1]}m"
	  end
	end



end
