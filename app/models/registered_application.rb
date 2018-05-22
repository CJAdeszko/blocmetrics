class RegisteredApplication < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :url, presence: true, uniqueness: true
  
end
