class User < ActiveRecord::Base
  has_many :posts, dependent: :destroy
  # username
  # password
  # portfolio
  # about
  # quest book
end

class Post < ActiveRecord::Base
  belongs_to :user
  # content
  # user_id
  # category
  # title
end
