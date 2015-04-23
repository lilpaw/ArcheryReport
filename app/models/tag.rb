class Tag < ActiveRecord::Base
  validates :word, presence: true
end
