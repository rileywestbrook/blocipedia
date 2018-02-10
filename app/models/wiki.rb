class Wiki < ApplicationRecord
  belongs_to :user
  has_many :collaborators
  has_many :users, through: :collaborators

  after_initialize :privacy_toggle

  private

  def privacy_toggle
    self.private = false if self.private.nil?
  end
end
