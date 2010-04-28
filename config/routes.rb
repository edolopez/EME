ActionController::Routing::Routes.draw do |map|
  map.resources :consultas

  map.resources :consultas

  map.resources :consultas

  map.resources :consultas

	map.signup '/signup', :controller => "pacientes", :action => "new"
	map.perfil '/perfil', :controller => "usuarios", :action => "perfil"
	map.clinica '/clinica', :controller => "clinicas", :action => "perfil"
  map.administrador '/administrador', :controller => "admins", :action => "perfil"

  map.resources :clinicas
  map.resources :doctors
  map.resources :pacientes
  map.resources :usuarios
  map.resources :trabajos
  map.resources :admins

	map.root :controller => "admin", :action => "login"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

