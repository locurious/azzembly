class User < ActiveRecord::Base
  
  belongs_to :business
  
  validates_presence_of :type, :on => :create, :message => "can't be blank"
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me, :type
  
  VALID_TYPES = []
  def self.inherited(child)
    super
    VALID_TYPES << child.name
  end
  
  
  def self.build(params)
    type = params.delete(:type)
    params = params.clone
    case type
      when USER_TYPE_SCHOOL
        return SchoolUser.new(params)
      when USER_TYPE_BUSINESS
        return BusinessUser.new(params)
      else
        raise "Invalid type for user.build: #{type.to_s}"
    end
  end
  
  def user_type
    self.class.name
  end
  
end


class SchoolUser < User
  def self.slug; USER_TYPE_SCHOOL; end
end

class BusinessUser < User
  def self.slug; USER_TYPE_BUSINESS; end
  
end
