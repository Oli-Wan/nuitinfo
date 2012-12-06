class Item < ActiveRecord::Base
  attr_accessible :content, :content_type, :date, :location, :name, :published,
                  :latitude, :altitude, :longitude

  #Relations
  has_many :mediums
  has_and_belongs_to_many :tags
  belongs_to :author, :class_name => 'User'
  has_many :children, :class_name => 'Item',
           :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Item'

end
