class Usuario < ActiveRecord::Base
	validates :nome, presence: true, length: {maximum: 50}
	validates :email, presence: true, length:{maximum: 255}

end
