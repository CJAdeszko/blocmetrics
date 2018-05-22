class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
         has_many :registered_applications, dependent: :destroy

         validates :email, presence: true

         validates_format_of :email, :with => Devise.email_regexp

         validates :password, length: { minimum: 6 }, unless: "password.nil?"
         validates :password, presence: true, if: "id.nil?"
end
