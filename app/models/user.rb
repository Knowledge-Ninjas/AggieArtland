class User < ApplicationRecord
    has_secure_password
  validates :email, presence: true
  validates :password, presence: true, length: { minimum: 6 }
  after_initialize :init

  def init
    self.stamps  ||= 0.0           #will set the default value only if it's nil
    self.badges  ||= 0.0           #will set the default value only if it's nil
  end

  def is_admin?
    user_type == "admin"
  end

  def has_stamp(art_piece)
    (self.stamps & (1 << art_piece.id)) >> art_piece.id == 1
  end

  def has_badge(badge)
    (self.badges & (1 << badge.id)) >> badge.id == 1
  end

  def set_stamp(art_piece, new_has_stamp)
    if new_has_stamp
      self.stamps = self.stamps | (1 << art_piece.id)
    else
      self.stamps = ~((~self.stamps) | (1 << art_piece.id))
    end

    self.update_attribute(:stamps, self.stamps)
  end

  def set_badge(badge, new_has_badge)
    if new_has_badge
      self.badges = self.badges | (1 << badge.id)
    else
      self.badges = ~((~self.badges) | (1 << badge.id))
    end

    self.update_attribute(:badges, self.badges)
  end

  def get_earned_stamps()
    ArtPiece.all.select { |art_piece| has_stamp(art_piece) }
  end

  def get_earned_badges()
    Badge.all.select { |badge| has_badge(badge) }
  end

  def get_first_n_stamps(n)
    get_earned_stamps.take(n)
  end

  def get_first_n_badges(n)
    get_earned_badges.take(n)
  end


end
