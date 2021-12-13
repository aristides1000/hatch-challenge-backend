class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :jwt_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, jwt_revocation_strategy: JwtDenylist

  has_many :addresses

  attr_accessor :token

  def on_jwt_dispatch(token, _)
    @token = token.to_s
  end
end
