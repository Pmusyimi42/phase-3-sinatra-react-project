class User < ActiveRecord::Base
    has_many :comments
    has_many :quotes, through: :comments
end