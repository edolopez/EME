ActionController::Routing::Routes.draw do |map|

	map.signup '/signup', :controller => "usuarios", :action => "new"
	map.perfil '/perfil', :controller => "usuarios", :action => "perfil"  
	map.resources :paciente_doctors
  map.resources :doctor_clinicas
  map.resources :clinicas
  map.resources :doctors
  map.resources :pacientes
  map.resources :usuarios
	map.root :controller => "admin", :action => "login"

 
  map.connect ':controller/:action/:id'
  map.connect ':controller/:action/:id.:format'
end
