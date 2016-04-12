class SessoesController < ApplicationController
  	def new
  	end
  	def create
		sessao = Sessao.find_by(email: params[:sessao][:email].downcase)
    if usuario && usuario.authenticate(params[:sessao][:password])
      # Log the user in and redirect to the user's show page.
    else
      algo deu errado
    render 'new'
     end
  	end
	
	def destroy
  	end
end
