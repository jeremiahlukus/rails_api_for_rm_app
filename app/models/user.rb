class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, 
         :confirmable, :token_authenticatable

  before_save :ensure_authentication_token
  #attr_accessor :name, :email, :password, :password_confirmation, :remember_me

 has_many :feedbacks 
 has_many :requests
  def skip_confirmation!
    self.confirmed_at = Time.now
  end
end
