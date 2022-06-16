class User < ApplicationRecord
    # To add to a user: User.create({email:"example@email.com", password:"password", password_confirmation:"password"})

    has_secure_password

    #To validate required inputs
    # use format for regex
    validates :email, presence: true
end
