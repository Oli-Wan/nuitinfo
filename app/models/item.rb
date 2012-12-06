class Item < ActiveRecord::Base
  attr_accessible :content, :content_type, :date, :location, :name, :published
end
