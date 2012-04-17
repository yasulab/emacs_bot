class Command < ActiveRecord::Base
  attr_accessible :command, :description
  
  validates :command, presence: true
  validates :description, presence: true, length: { maximum: 140 }
end
