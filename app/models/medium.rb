class Medium < ActiveRecord::Base
  attr_accessible :description, :media_url, :name

  belongs_to :item
end
