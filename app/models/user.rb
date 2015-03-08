class User < ActiveRecord::Base
  include Semesters
  mount_uploader :resume, ResumeUploader
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  has_many :courses
  has_many :blog_posts
  has_many :rsvps
  has_many :payments
  serialize :paid, Array
  has_many :event_rsvps, through: :rsvps, source: :event
  has_and_belongs_to_many :events

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :admin, :first_name, :last_name,
                  :graduation, :has_paid, :resume, :name_tag, :ok_name, :shirt_size, :gender, :paid

  validates_uniqueness_of :email
  validates_format_of :email, :with => /\A([^@\s]+)@((?:asu+\.)+edu)\Z/i, :on => :create, :message => "Must be a valid asu email address"
  validates_presence_of :first_name, :last_name, :graduation, :shirt_size, :gender

  def admin?
    self.admin
  end

  def capitalize_hyphenated(last_name)
    if last_name.include? "-"
      last_name.split("-").map(&:capitalize).join("-")
    else
      last_name.capitalize
    end
  end

  def full_name
    "#{first_name.capitalize} #{capitalize_hyphenated(last_name)}"
  end

  def attend(event)
    return false if self.nil?
    return true if self.events << event
  end

  def self.find_by_full_name(name)
    first, last = name.split(" ")
    all.select { |u| u.first_name.downcase == first.downcase && u.last_name.downcase == last.downcase }
  end

  def currently_paid
    paid_semester = payments.map { |payment| date_to_semester(payment.payment_end) }
    paid_semester.include?(current_semester) || paid_semester.include?(next_semester)
  end


end
