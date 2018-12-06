Rails.application.routes.draw do
  # Routes for the Playlist resource:

  # CREATE
  get("/playlists/new", { :controller => "playlists", :action => "new_form" })
  post("/create_playlist", { :controller => "playlists", :action => "create_row" })

  # READ
  get("/playlists", { :controller => "playlists", :action => "index" })
  get("/playlists/:id_to_display", { :controller => "playlists", :action => "show" })

  # UPDATE
  get("/playlists/:prefill_with_id/edit", { :controller => "playlists", :action => "edit_form" })
  post("/update_playlist/:id_to_modify", { :controller => "playlists", :action => "update_row" })

  # DELETE
  get("/delete_playlist/:id_to_remove", { :controller => "playlists", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
