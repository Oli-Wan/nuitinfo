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

require 'test_helper'

class MediumTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
