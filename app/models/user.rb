class User < ApplicationRecord
  has_many :links

  devise(
    :database_authenticatable,
    :recoverable,
    :registerable,
    :rememberable,
    :validatable
  )
end
