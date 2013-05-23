class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  #

  has_many :course
  has_and_belongs_to_many :events

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :first_name, :last_name, :graduation

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:asu+\.)+edu)\Z/i, :on => :create, :message => "Must be a valid asu email address"
  validates_presence_of :first_name, :last_name, :graduation

  def admin?
    self.admin
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def attend(event)
    return false if self.nil?
    return true if self.events << event
  end
end
