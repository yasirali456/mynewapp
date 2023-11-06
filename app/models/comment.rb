class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :article

	has_many :child, class_name: "Comment", foreign_key: "parent_id"

	belongs_to :parent, class_name: "Comment", optional: true
end
