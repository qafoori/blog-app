class User < ApplicationRecord
  VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze
  validates :username,
            presence: true,
            length: {
              minimum: 3,
              maximum: 5
            },
            uniqueness: {
              case_sensitive: false
            }
  validates :email,
            presence: true,
            length: {
              maximum: 105
            },
            uniqueness: {
              case_sensitive: false
            },
            format: {
              with: VALID_EMAIL
            }
end
