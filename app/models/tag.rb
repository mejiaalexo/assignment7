class Tag < ActiveRecord::Base
	has_and_belongs_to_many :todo_items

	def to_s
		puts :tag_name
	end
end
