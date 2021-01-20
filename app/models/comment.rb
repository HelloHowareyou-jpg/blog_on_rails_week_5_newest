class Comment < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :post
  validates :body, presence: {message: " should be present."}
end
