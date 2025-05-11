class Appointment < ApplicationRecord
  belongs_to :patient
  belongs_to :created_by, class_name: 'User'

  validates :patient_id, presence: true
  validates :appointment_date, presence: true
  validates :status, presence: true
  validates :created_by_id, presence: true

  enum :status, {
    scheduled: 0,
    completed: 1,
    cancelled: 2,
    no_show: 3
  }

end 