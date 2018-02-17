class Collaborator < ApplicationRecord
  belongs_to :wiki
  belongs_to :user

  def self.update_collaborators(collaborator_string, wiki)
    return if collaborator_string.blank?
    collaborator_string.split(",").map do |email|
      user = User.find_by(email: email)# lookup user by email
      next if user.nil?
      Collaborator.find_or_create_by(
        wiki: wiki,
        user: user
      )
    end
  end
end
