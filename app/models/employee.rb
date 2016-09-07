class Employee < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :phone, presence: true
  has_and_belongs_to_many :departments
  enum role: { manager: 0, staff: 1 }
  enum gender: { female: 0, male: 1 }

  def json
    self.as_json(except: [:created_at, :updated_at], include: {departments: {only: :name}})
  end
end
