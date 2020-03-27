class Competition < ApplicationRecord
	has_one_attached :photo

	validates :name, presence: true
	validates :location, presence: true
	validates :date, presence: true
end
