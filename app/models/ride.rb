class Ride < ActiveRecord::Base
belongs_to :attraction
belongs_to :user

  def enough_tickets?
    user.tickets >= 5
  end

  def tall_enough?
    user.height > 30
  end

  def update_user
    user.tickets = user.tickets - attraction.tickets
    user.happiness = user.happiness + attraction.happiness_rating
    user.nausea = user.nausea + attraction.nausea_rating
    user.save
  end

  def take_ride
    if self.enough_tickets? && self.tall_enough?
      self.update_user
      "Thanks for riding the #{self.attraction.name}!"
    else
      if !self.enough_tickets? && !self.tall_enough?
      "Sorry. You do not have enough tickets to ride the #{self.attraction.name}. You are not tall enough to ride the #{self.attraction.name}."
      elsif !self.enough_tickets?
        "Sorry. You do not have enough tickets to ride the #{self.attraction.name}."
      elsif !self.tall_enough?
        "Sorry. You are not tall enough to ride the #{self.attraction.name}."
      end
    end
  end

end
