# == Schema Information
#
# Table name: admins
#
#  id          :bigint(8)        not null, primary key
#  user_id     :integer
#  busniess_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Admin < ApplicationRecord
  belongs_to :user
  belongs_to :busniess
  validates :user_id, presence: true
  validates :busniess_id, presence: true

  def find_busniess_name(admin)
    (Busniess.find admin.busniess_id).name
  end
end
