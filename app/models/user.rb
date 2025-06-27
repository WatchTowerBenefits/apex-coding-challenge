class User < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true

  serialize :tags, coder: YAML
end
