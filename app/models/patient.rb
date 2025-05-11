class Patient < ApplicationRecord
  has_many :medical_cases, dependent: :destroy
  has_many :appointments, dependent: :destroy
  has_many :categories, through: :medical_cases

  validates :name, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, allow_blank: true
end 