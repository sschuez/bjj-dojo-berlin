class Competition < ApplicationRecord
	has_one_attached :photo
	has_many :competition_appointments, dependent: :destroy
	has_many :users, through: :competition_appointments

	validates :name, presence: true
	validates :location, presence: true
	validates :date, presence: true
end
