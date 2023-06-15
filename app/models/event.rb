class Event < ApplicationRecord
    belongs_to :creator, class_name: 'User'
    has_many :attendances, dependent: :destroy
    has_many :attendees, through: :attendances, source: :user
    has_many :invitations

    validates :invite_only, inclusion: { in: [true, false] }

    scope :past_events, -> { where('date < ?', Date.today)}
    scope :future_events, -> { where('date >= ?', Date.today)}
    # has_many :events_attendances, foreign_key: :attended_event_id
    # has_many :attendees, through: :events_attendances, source: :users
end
