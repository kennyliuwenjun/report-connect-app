# == Schema Information
#
# Table name: busniesses
#
#  id         :bigint(8)        not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Busniess < ApplicationRecord
  has_many :admins
  has_many :reports
  has_and_belongs_to_many :users
end
