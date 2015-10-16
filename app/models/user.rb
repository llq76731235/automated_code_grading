class User < ActiveRecord::Base
  belongs_to :course
  has_many :homeworks
  has_many :submissions
  has_many :courses

  validates :user_email, presence: true
  validates :user_password, presence: true
  validates :user_name, presence: true
  validates :course_id, presence: true
  validates_uniqueness_of :user_email

  def self.new_student(user_params)
    user_params[:user_role] = 'student' 
    return self.new(user_params)
  end

  def authenticate(password)
    if self.user_password == password
      return true
    else
      return false
    end
  end
end
