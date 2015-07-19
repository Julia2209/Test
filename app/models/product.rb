class Product < ActiveRecord::Base
  
  #attr_accessible :name, :description
  
  validates :name, presence: true, length: {minimum: 3, maximum: 30}, uniqueness: true
end
