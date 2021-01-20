class User < ApplicationRecord
    has_many :posts, dependent: :nullify
    has_many :comments, dependent: :nullify

    has_secure_password

    def full_name
        "#{first_name} #{last_name}"
    end
end
