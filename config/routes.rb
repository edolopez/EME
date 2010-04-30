ActionController::Routing::Routes.draw do |map|
  map.resources :pacientes


	map.signup '/signup', :controller => "pacientes", :action => "new"
	map.paciente '/root', :controller => "admins", :action => "index"

  map.resources :clinicas
  map.resources :doctors
  map.resources :usuarios
  map.resources :trabajos
  map.resources :admins
	map.resources :consultas
	map.root :controller => "admin", :action => "login"

  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end

