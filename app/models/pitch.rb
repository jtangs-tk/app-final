# == Schema Information
#
# Table name: pitches
#
#  id         :integer          not null, primary key
#  address    :string
#  image      :string
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
class Pitch < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  has_many  :posts, class_name: "Post", foreign_key: "pitch_id", dependent: :destroy

end
