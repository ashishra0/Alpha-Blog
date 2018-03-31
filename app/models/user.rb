class User < ApplicationRecord
    has_many :articles, dependent: :destroy
    validates :username, presence: true, uniqueness: {case_sensitive: false}, length: { minimum: 3, maximum: 25}
        VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, uniqueness: {case_sensitive: false}, length: {maximum: 105},
        format: {with: VALID_EMAIL_REGEX}
    has_attached_file :avatar, styles: {medium: "300x300>", thumb: "100x100#" }
    validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/  
    validates :avatar, attachment_presence: true
    validates_with AttachmentPresenceValidator, attributes: :avatar
    validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 5.megabytes 
    has_secure_password
end