class Librarian < ActiveRecord::Base
    attr_accessor :remember_token
    before_save { self.email = email.downcase }
    validates :first_name, presence: true, length: {maximum: 9}
    validates :last_name, presence: true,  length: {maximum: 10}
    validates :birth_month, presence: true, length: {maximum: 2}
    validates :birth_year, presence: true, length: {maximum: 4}
    validates :birth_day, presence: true, length: {maximum: 2}
    VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence: true, length: { maximum: 255 },
                            format: { with: VALID_EMAIL_REGEX }
    has_attached_file :profile_pic, :styles => {:thumb => "100x100>"},
                      default_url: "/images/:style/missing.png"
    validates_attachment_content_type :profile_pic, content_type: /\Aimage\/.*\Z/
    GENDER_TYPES = ["Unspecified","Male", "Female"]
    BIRTH_MONTH_CONTENT = ["Jan","Feb", "Mar", "Apr", "May", "June", "Jul", "Aug", "Oct", "Nov"]

    has_secure_password
    validates :password, presence: true, length: { minimum: 6 }

  # Returns the hash digest of the given string.
  def Librarian.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  #returns a random token
  def Librarian.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = Librarian.new_token
    update_attribute(:remember_digest, Librarian.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  # Forgets a user.
  def forget
    update_attribute(:remember_digest, nil)
  end

end
