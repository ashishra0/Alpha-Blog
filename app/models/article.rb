class Article < ApplicationRecord
    belongs_to :user
    validates :title, presence: true, length: {minimum: 3, maximum: 50}
    validates :description, presence: true, length: {minimum: 10, maximum: 10000}
    has_attached_file :image, styles: { large: "600x600", medium: "300x300>", thumb: "100x100#" }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end