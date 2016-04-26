class Librarian < ActiveRecord::Base
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


end
