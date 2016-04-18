class Comment < ActiveRecord::Base
  belongs_to :blog

    validates :commenter, presence: {message: "投稿者名が空です"}, length: {maximum: 20, message: "投稿者名が長過ぎます"}
    validates :body, presence: {message: "コメントが空です"}


end
