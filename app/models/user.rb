class User < ApplicationRecord
	has_secure_password
	has_many :articles
	has_many :comments
	validates :username, presence: true, uniqueness: {case_sensitive: false }, length: { minimum: 3, maximum: 10}
	VALID_EMAIL = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, uniqueness: {case_sensitive: false} , format: {with: VALID_EMAIL}
	before_save {self.email = email.downcase}\
end 
