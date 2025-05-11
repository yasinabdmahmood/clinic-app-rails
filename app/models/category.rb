class Category < ApplicationRecord
  has_many :medical_cases, dependent: :destroy
  has_many :patients, through: :medical_cases

  validates :title, presence: true
end 