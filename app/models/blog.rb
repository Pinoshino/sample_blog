class Blog < ActiveRecord::Base

    has_many :comments
    
    validates :title, presence: {message: "タイトルが空です"}, length: {maximum: 20, message: "タイトルが長過ぎます"}
    validates :content, presence: {message: "本文が空です"}
    
end
