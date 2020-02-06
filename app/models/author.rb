class Author < ActiveRecord::Base
  has_many :articles

  # has_secure_password does a few things for us
  # it gives us what setter method????
    # - #password=
  # allow us to hash and salt our passwords
  # allows us, given a string, to compare that string with the hashed version of the password that's in the db
  # using the #authenticate method (which comes from ActiveRecord)
  # has_secure_password also automatically includes a presence validator on our password (password_digest)
  has_secure_password

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true


  # NEVER DO THIS!!!!!!! when using has_secure_password & bcrypt
  # author.password_digest=
  # author.update(password_digest: "nonononoonoon")
  # validates :password, presence: true
end
