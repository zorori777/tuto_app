class User < ApplicationRecord

  before_save { email.downcase! }

  validates :name, presence: true,
                    length: { maximum: 50 }

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email,
            presence: true,
            length: { maximum: 255},
            format: { with: VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i  },

            #case_sensitiveオプションにfalseを指定することで、大文字小文字の差を無視するすることが可能です。
            uniqueness: { case_sensitive: false }

  validates :password,
            presence: true,
            length: { minimum: 6 }

  has_secure_password

end
