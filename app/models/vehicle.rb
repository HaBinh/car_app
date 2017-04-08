class Vehicle < ApplicationRecord
	has_many :rentals, dependent: :destroy
    # validates :name,  presence: true, length: { maximum: 100 }
	validate :start_end_date
	def start_end_date
		if start_at.present? && end_at.present? && start_at > end_at
			errors.add(:end_at, "Error datetime")		
		end
	end
	def self.search(search)
      if search
        where(["brand LIKE ?", "%#{search}%"])
      else
        all
      end
    end
end
