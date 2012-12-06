class Item < ActiveRecord::Base
  attr_accessible :content, :content_type, :date, :location, :name, :published,
                  :latitude, :altitude, :longitude

  #Relationsf
  has_many :mediums
end
