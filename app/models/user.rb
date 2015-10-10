class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         #,:confirmable
         #, :lockable, :timeoutable, :omniauthable

          has_many :search_problems
          has_many :partnerships, dependent: :destroy
          has_many :projects, :through => :partnerships
          has_many :supporters, dependent: :destroy
          has_many :problems, :through => :supporters
          has_many :profiles, :as => :profileable, dependent: :destroy
          has_many :comments, :as => :commentable, dependent: :destroy
          acts_as_commentable
          acts_as_votable

end
