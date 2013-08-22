require_relative '../../db/config'
require 'date'

class Student < ActiveRecord::Base
  validates :email, format: { with: /.@+.*\.+.{2,}/}, uniqueness: true
  validate :check_age, :phone_check

  def name
    "#{first_name} #{last_name}"  
  end

  def check_age
    if DateTime.now.year - birthday.year < 5 
      errors.add(:birthday, "too young kiddo!")
    end
  end

  def phone_check
    if phone.gsub(/[()-]| /, '').length < 10
      errors.add(:phone, "Please enter a valid phone with area code")
    end
  end

end
