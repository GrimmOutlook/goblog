class Post < ActiveRecord::Base
	validates_presence_of :title, :content
	validates :title, length: { minimum: 2 }
	validates :title, uniqueness: {message: "already taken"}
end
