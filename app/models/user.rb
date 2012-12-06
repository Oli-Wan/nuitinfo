class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # , :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  #Relation
  has_many :items
  has_many :mediums

  def self.authenticate(email, password)
    user = User.find_for_authentication(:email => email)
    if (user)
      user.valid_password?(password) ? user : nil
    end
  end
end
