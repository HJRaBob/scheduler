class User < ActiveRecord::Base
  before_save :default_values
  after_create :create_service
  
  def default_values
      self.service_number ||= 8
  end
  
  def create_service
    for i in 0..7
      Service.create(
        :user_id => self.id,
        :sequence => (i+1)
      )
    end
  end 
  has_many :services

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
