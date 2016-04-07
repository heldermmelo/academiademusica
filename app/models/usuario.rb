class Usuario < ActiveRecord::Base
	validates :nome, presence: true, length: {maximum: 50}
	EXPRESSAO_REGULAR_VALIDA = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length:{maximum: 255},
	 format: { with: EXPRESSAO_REGULAR_VALIDA },
	uniqueness: true
has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
	

end
