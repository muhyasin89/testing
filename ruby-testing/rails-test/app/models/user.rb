require 'bcrypt'
require 'digest/sha1'

class User < ActiveRecord::Base
    include BCrypt
    has_secure_password

    has_many :articles
    attr_accessor :password

    before_save :encrypt_password
    after_save :clear_password

    # basic hash password
    # encrypted_password= Digest::SHA1.hexdigest(password)
    #this include salt to encrypt
    # salt= Digest::SHA1.hexdigest("# We add {email} as unique value and #{Time.now} as random value")
    # encrypted_password= Digest::SHA1.hexdigest("Adding #{salt} to {password}")

    #EMAIL_REGEX = /^[A_Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}$/i   #this is error
    #EMAIL_REGEX = /A[w+-.]+@[a-zd-.]+.[a-z]+z/i

    #EMAIL_REGEX = ^.+@.+$
    EMAIL_REGEX =  /\A[A_Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\Z/i
    validates :password, confirmation: true, presence: true, uniqueness: true, length: { in: 8..30 }
    validates :email, presence: true, uniqueness: true, format: EMAIL_REGEX

    # check why you implement this 2 function href="https://github.com/codahale/bcrypt-ruby"
    # def password
    #     @password ||= Password.new(password_hash)
    # end

    # def password=(new_password)
    #     @password = Password.create(new_password)
    #     self.password_hash = @password
    # end

    def encrypt_password
        if password.present?
            self.salt =BCrypt::Engine.generate_salt
            self.encrypt_password = BCrypt::Engine.hash_secret(password, salt)
        end
    end

    def clear_password
        self.password = nil
    end
end
