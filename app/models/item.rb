# == Schema Information
#
# Table name: items
#
#  id           :integer          not null, primary key
#  name         :string(255)
#  content      :text
#  date         :date
#  content_type :string(255)
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  published    :boolean          default(TRUE)
#  longitude    :string(255)
#  latitude     :string(255)
#  altitude     :string(255)
#  author_id    :integer
#  parent_id    :integer
#

class Item < ActiveRecord::Base
  attr_accessible :content, :content_type, :date, :name, :published,
                  :latitude, :altitude, :longitude

  # Relations
  has_many :mediums
  has_and_belongs_to_many :tags
  belongs_to :author, :class_name => 'User'
  has_many :children, :class_name => 'Item',
           :foreign_key => 'parent_id'
  belongs_to :parent, :class_name => 'Item'

end
