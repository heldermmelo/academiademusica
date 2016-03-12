require 'test_helper'

class UsuarioTest < ActiveSupport::TestCase
	def setup
		@usuario = Usuario.new(nome: "Exemplo Sou", email: "usuario@exemplo.com")
	end
	
	test "deve ser valido" do
		assert @usuario.valid?
	end
	
	test "nome precisa estar presente" do
		@usuario.nome = "     "
		assert_not @usuario.valid?
	end
	test "email precisa estar presente" do
		@usuario.email = "   "
		assert_not @usuario.valid?
	end
end
