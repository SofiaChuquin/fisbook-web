class User < ApplicationRecord
    devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable
    def get_token
        self.update_attribute(:token, SecureRandom.urlsafe_base64(nil, false)) if token.blank?
        token
    end

    def person
        Person.find_by_email(email)
    end

end
