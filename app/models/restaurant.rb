class Restaurant < ApplicationRecord
  has_many :comments, dependent: :destroy
  belongs_to :user

  validates :name, presence: true
  validates :address, presence: true
end
