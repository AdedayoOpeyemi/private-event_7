class User < ApplicationRecord
  has_many :events, foreign_key: :creator_id
  has_many :attendances
  has_many :attended_events, through: :attendances, source: :event
  has_many :invitations


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  def attending_event?(event)
    event.attendees.exists?(id)
  end
end
