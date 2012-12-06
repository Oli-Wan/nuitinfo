class Medium < ActiveRecord::Base
  attr_accessible :description, :media_url, :name

  belongs_to :item
  belongs_to :author, :class_name => 'User'
end
