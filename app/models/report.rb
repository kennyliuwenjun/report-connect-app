# == Schema Information
#
# Table name: reports
#
#  id          :bigint(8)        not null, primary key
#  business_id :integer
#  date        :date
#  sales       :money
#  expenses    :money
#  comments    :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Report < ApplicationRecord
  belongs_to :business, :optional => true
end
