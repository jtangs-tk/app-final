# == Schema Information
#
# Table name: posts
#
#  id         :integer          not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pitch_id   :integer
#  user_id    :integer
#
class Post < ApplicationRecord
  belongs_to :user, required: true, class_name: "User", foreign_key: "user_id"
  belongs_to :pitch, required: true, class_name: "Pitch", foreign_key: "pitch_id"
end
