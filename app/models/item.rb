class Item < ActiveRecord::Base
  attr_accessible :content, :content_type, :date, :location, :name, :published
  has_many :mediums
end
