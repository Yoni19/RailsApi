class User < ApplicationRecord
  devise :database_authenticatable,
         :jwt_authenticatable,
         :registerable,
         :recoverable,
         :validatable,
         jwt_revocation_strategy: JwtBlacklist
  has_many :articles

  validates :username, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :username, presence: true

 
end
