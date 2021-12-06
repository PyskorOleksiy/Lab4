class Club < ApplicationRecord
	has_many :players, dependent: :destroy
	has_one :coach, dependent: :destroy
end
