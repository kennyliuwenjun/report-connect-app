# == Schema Information
#
# Table name: reports
#
#  id         :bigint(8)        not null, primary key
#  date       :date
#  sales      :decimal(, )
#  expenses   :decimal(, )
#  comments   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Report < ApplicationRecord
  belongs_to :busniess, :optional => true
end
