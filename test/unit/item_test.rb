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
#  published    :boolean
#  longitude    :string(255)
#  latitude     :string(255)
#  altitude     :string(255)
#  author_id    :integer
#  parent_id    :integer
#

require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
