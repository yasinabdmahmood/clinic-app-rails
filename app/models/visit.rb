class Visit < ApplicationRecord
  belongs_to :medical_case

  validates :medical_case_id, presence: true
  validates :visit_date, presence: true
end 