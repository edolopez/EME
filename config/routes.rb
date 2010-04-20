ActionController::Routing::Routes.draw do |map|
	map.signup '/signup', :controller => "pacientes", :action => "new"
	map.perfil '/perfil', :controller => "usuarios", :action => "perfil"
	map.clinica '/clinica', :controller => "usuarios", :action => "perfilClinica"

  map.resources :clinicas
  map.resources :doctors
  map.resources :pacientes
  map.resources :usuarios
  map.resources :trabajos

	map.root :controller => "admin", :action => "login"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

