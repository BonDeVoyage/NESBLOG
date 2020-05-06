class Article < ApplicationRecord
	belongs_to :user
	has_many :comments
    validates :title, presence: true, length: {minimum: 3, maximum: 20}
	validates :text, presence: true, length: {minimum: 10, maximum: 1000}
	validates :created_by, presence: false
	validates :user_id, presence: true
end 
