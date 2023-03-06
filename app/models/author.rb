class Author < ActiveRecord::Base
    has_many :quotes
    has_many :comments, through: :quotes
end