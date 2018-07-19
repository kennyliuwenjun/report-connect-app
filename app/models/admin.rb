# == Schema Information
#
# Table name: admins
#
#  id          :bigint(8)        not null, primary key
#  user_id     :integer
#  business_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Admin < ApplicationRecord
  belongs_to :user
  belongs_to :business
  validates :user_id, presence: true
  validates :business_id, presence: true

  def find_business_name(admin)
    (Business.find admin.business_id).name
  end
end
