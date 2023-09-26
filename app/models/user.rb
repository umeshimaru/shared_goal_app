class User < ApplicationRecord
  has_one :monthly_goal
  has_many :weekly_goals, through: :monthly_goal

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:confirmable 



         validates :name , presence:true,  uniqueness: true
         


end 

