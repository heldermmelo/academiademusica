class SessoesController < ApplicationController
  	def new
  	end
  	def create
		usuario = Usuario.find_by(email: params[:sessao][:email].downcase)
    if usuario && usuario.authenticate(params[:sessao][:password])
      # Log the user in and redirect to the user's show page.
    else
      # Create an error message.
    render 'new'
     end
  	end
	
	def destroy
  	end
end
