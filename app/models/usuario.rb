class Usuario < ActiveRecord::Base
	#self.primary_key = "usuario_id"
	has_many :usuarios_videos
	has_many :videos, :through => :usuarios_videos

	attr_accessor :remember_token
	before_save { self.email = email.downcase }
	validates :nome, presence: true, length: {maximum: 50}
	EXPRESSAO_REGULAR_VALIDA = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length:{maximum: 255},
	 format: { with: EXPRESSAO_REGULAR_VALIDA },

	uniqueness: {case_sensitive: false}
	has_secure_password
  	validates :password, presence: true, length: { minimum: 6 }
#	has_attached_file :video, :styles =>{medium = "300x300" =>:thumb} 

	# Returns the hash digest of the given string.
  def Usuario.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Retorna um token aleatório
  def Usuario.new_token
    SecureRandom.urlsafe_base64
  end

  # Remember um usuario no database for use in persistent sessions.
  def remember
    self.remember_token = Usuario.new_token
    update_attribute(:remember_digest, Usuario.digest(remember_token))
  end

  # Returns true if the given token matches the digest.
  def authenticated?(remember_token)
    return false if remember_digest.nil?
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end
  def forget
	update_attribute(:remember_digest, nil)
  end
end
