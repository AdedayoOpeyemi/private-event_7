class Invitation < ApplicationRecord
  belongs_to :user
  belongs_to :event

  def status
    if accepted? && !declined?
      'accepted'
    elsif declined?
      'declined'
    else
      'pending'
    end
  end
end
