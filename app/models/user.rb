class User < ApplicationRecord
  has_many :posts
  validates :email, presence: true
  validates :name, presence: true
  validates :auth_token, presence: true

  after_initialize :generate_auth_token

  def generate_auth_token
    # User.new
    # if !auth_token_present?
      unless auth_token.present?
        # generate token
        self.auth_token = Token_GenerationServce.generate
      end
  end

end
