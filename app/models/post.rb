class Post < ActiveRecord::Base
	validates_presence_of :title, :content
	validates :title, length: { minimum: 2 }
	validates :title, uniqueness: {message: "already taken"}

	has_many :comments

	has_many :taggings
	has_many :tags, :through => :taggings

	def tag_list
		self.tags.collect do |tag|
			tags.name.join = (", ")
		end
	end
end
