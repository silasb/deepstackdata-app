class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :notifications

  after_create :create_welcome_notification

  validates_uniqueness_of :email, scope: :tenant_id
  default_scope { where(tenant_id: Tenant.current_id) }

private

  def create_welcome_notification
    notifications.create(message: 'Welcome')
  end
end
