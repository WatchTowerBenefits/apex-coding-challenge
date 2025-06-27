class User < ApplicationRecord
  validate :first_name, presence: true
  validate :last_name, presence: true
  
  serialize :tags, Array
end
