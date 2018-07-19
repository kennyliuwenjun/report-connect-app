# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord
  has_secure_password
  validates :email, :presence => true, :uniqueness => true
  has_many :admins
  has_and_belongs_to_many :businesses

  def is_admin(business_id)
    (Admin.find_by :user_id => self.id, :business_id => business_id).present?
  end

  def is_watching(business_id)
    self.businesses.exists?(business_id).present?
  end

  def remove_watching(business_id)
    self.businesses.delete(Business.find(business_id))
  end

  def add_to_admin(business_id)
    if self.is_watching(business_id)
      self.remove_watching(business_id)
    end
    Admin.create :user_id => self.id, :business_id => business_id
  end

  def add_to_watch(business_id)
    self.businesses << Business.find(business_id)
  end

  def leave_business(business_id)
    if self.is_watching(business_id)
      self.remove_watching(business_id)
    else
      (Admin.find_by :user_id => self.id, :business_id => business_id).destroy
    end
  end
end
