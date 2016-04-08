module UsuariosHelper
	 # Returna o Gravatar para usuario
  def gravatar_for(usuario)
    gravatar_id = Digest::MD5::hexdigest(usuario.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: usuario.nome, class: "gravatar")
  end
end
