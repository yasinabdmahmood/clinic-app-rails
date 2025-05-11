class MedicalCase < ApplicationRecord
  belongs_to :patient
  belongs_to :category
  has_many :visits, dependent: :destroy

  validates :patient_id, presence: true
  validates :category_id, presence: true
  validates :status, presence: true

  enum :status, {
    active: 0,
    resolved: 1,
    pending: 2,
    cancelled: 3
  }


end 