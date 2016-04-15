class SessionsController < ApplicationController
  	def new
  	end

def create
    usuario = Usuario.find_by(email: params[:session][:email].downcase)
    if usuario && usuario.authenticate(params[:session][:password])
     	log_in usuario
	remember usuario
	 params[:session][:remember_me] ? remember(usuario) : forget(usuario)
	redirect_to usuario 
    else
      # Create an error message.
      	flash.now[:danger] = 'Email e/ou password inválido' #precisa melhorar!
	render 'new'
    end
end
	def destroy 
	log_out if logado?
    	redirect_to root_url
	end
  end
