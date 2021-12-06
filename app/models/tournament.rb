class Tournament < ApplicationRecord
	has_many :homes, dependent: :destroy
	has_many :aways, dependent: :destroy
end
