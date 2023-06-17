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

  def accept!
    update(accepted: true, declined: false)
  end

  def decline!
    update(accepted: false, declined: true)
  end
end
