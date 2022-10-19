class Post < ApplicationRecord
  validates :content, length:{in: 1..10}
end
