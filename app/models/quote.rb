class Quote < ActiveRecord::Base
    has_many :comments
    belongs_to :author
    has_many :users, through: :comments
end
