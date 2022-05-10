class Post < ApplicationRecord
    has_one_attached :photo
    validates :title, presence: true, length: {minimum:5, maximum:30}
    validates :description, presence: true, length: {minimum:5, maximum:100}
    validates :photo, presence: true
end
