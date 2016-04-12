module SessionsHelper
#loga o usuario
def log_in(usuario)
	session[:usuario_id] = usuario.id
end

def current_usuario
	 @current_usuario ||= Usuario.find_by(id: session[:usuario_id])
	
end 


end
