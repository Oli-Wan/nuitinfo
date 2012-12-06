# == Schema Information
#
# Table name: media
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  description :string(255)
#  media_url   :string(255)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  item_id     :integer
#  author_id   :integer
#

class Medium < ActiveRecord::Base
  attr_accessible :description, :media_url, :name

  belongs_to :item
  belongs_to :author, :class_name => 'User'
end
