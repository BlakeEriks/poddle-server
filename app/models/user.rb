class User < ApplicationRecord
    has_and_belongs_to_many :podcasts
    has_and_belongs_to_many :genres
    has_secure_password
end
