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
  has_and_belongs_to_many :busniesses

  def is_admin(busniess_id)
    (Admin.find_by :user_id => self.id, :busniess_id => busniess_id).present?
  end

  def is_watching(busniess_id)
    self.busniesses.exists?(busniess_id).present?
  end

  def remove_watching(busniess_id)
    self.busniesses.delete(Busniess.find(busniess_id))
  end

  def add_to_admin(busniess_id)
    if self.is_watching(busniess_id)
      self.remove_watching(busniess_id)
    end
    Admin.create :user_id => self.id, :busniess_id => busniess_id
  end

  def add_to_watch(busniess_id)
    self.busniesses << Busniess.find(busniess_id)
  end

  def leave_busniess(busniess_id)
    if self.is_watching(busniess_id)
      self.remove_watching(busniess_id)
    else
      (Admin.find_by :user_id => self.id, :busniess_id => busniess_id).destroy
    end
  end
end
