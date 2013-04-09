class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  has_many :course

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :first_name, :last_name

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:asu+\.)+edu)\Z/i, :on => :create, :message => "Must be a valid asu email address"

  def admin?
    self.admin
  end

end
