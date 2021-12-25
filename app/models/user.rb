class User < ApplicationRecord
    has_and_belongs_to_many :podcasts
    has_secure_password
end
