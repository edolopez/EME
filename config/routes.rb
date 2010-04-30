ActionController::Routing::Routes.draw do |map|
  map.resources :consultas

	map.signup '/signup', :controller => "pacientes", :action => "new"
	map.perfil '/perfil', :controller => "usuarios", :action => "show"
	map.clinica '/clinica', :controller => "clinicas", :action => "show"
	map.paciente '/paciente', :controller => "pacientes", :action => "show"
  map.administrador '/administrador', :controller => "admins", :action => "show"

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

