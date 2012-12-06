class Item < ActiveRecord::Base
  attr_accessible :content, :content_type, :date, :location, :name, :published,
                  :latitude, :altitude, :longitude

  #Relationsf
  has_many :mediums
  has_and_belongs_to_many :tags
end
