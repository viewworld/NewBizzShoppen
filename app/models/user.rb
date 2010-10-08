class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :confirmable,
         :recoverable, :rememberable, :trackable, :validatable, :timeoutable
  attr_accessible :email, :password, :password_confirmation, :remember_me
end
