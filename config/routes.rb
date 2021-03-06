Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "playlists#index"
  # Routes for the Playlists song resource:

  # CREATE
  get("/playlists_songs/new", { :controller => "playlists_songs", :action => "new_form" })
  post("/create_playlists_song", { :controller => "playlists_songs", :action => "create_row" })
  post("/create_playlists_song_from_song", { :controller => "playlists_songs", :action => "create_row_from_song" })
  post("/create_playlists_song_from_playlist", { :controller => "playlists_songs", :action => "create_row_from_playlist" })

  # READ
  get("/playlists_songs", { :controller => "playlists_songs", :action => "index" })
  get("/playlists_songs/:id_to_display", { :controller => "playlists_songs", :action => "show" })

  # UPDATE
  get("/playlists_songs/:prefill_with_id/edit", { :controller => "playlists_songs", :action => "edit_form" })
  post("/update_playlists_song/:id_to_modify", { :controller => "playlists_songs", :action => "update_row" })

  # DELETE
  get("/delete_playlists_song/:id_to_remove", { :controller => "playlists_songs", :action => "destroy_row" })
  get("/delete_playlists_song_from_song/:id_to_remove", { :controller => "playlists_songs", :action => "destroy_row_from_song" })
  get("/delete_playlists_song_from_playlist/:id_to_remove", { :controller => "playlists_songs", :action => "destroy_row_from_playlist" })

  #------------------------------

  # Routes for the Playlists for activity resource:

  # CREATE
  get("/playlists_for_activities/new", { :controller => "playlists_for_activities", :action => "new_form" })
  post("/create_playlists_for_activity", { :controller => "playlists_for_activities", :action => "create_row" })
  post("/create_playlists_for_activity_from_activity", { :controller => "playlists_for_activities", :action => "create_row_from_activity" })
  post("/create_playlists_for_activity_from_playlist", { :controller => "playlists_for_activities", :action => "create_row_from_playlist" })

  # READ
  get("/playlists_for_activities", { :controller => "playlists_for_activities", :action => "index" })
  get("/playlists_for_activities/:id_to_display", { :controller => "playlists_for_activities", :action => "show" })

  # UPDATE
  get("/playlists_for_activities/:prefill_with_id/edit", { :controller => "playlists_for_activities", :action => "edit_form" })
  post("/update_playlists_for_activity/:id_to_modify", { :controller => "playlists_for_activities", :action => "update_row" })

  # DELETE
  get("/delete_playlists_for_activity/:id_to_remove", { :controller => "playlists_for_activities", :action => "destroy_row" })
  get("/delete_playlists_for_activity_from_activity/:id_to_remove", { :controller => "playlists_for_activities", :action => "destroy_row_from_activity" })
  get("/delete_playlists_for_activity_from_playlist/:id_to_remove", { :controller => "playlists_for_activities", :action => "destroy_row_from_playlist" })

  #------------------------------

  # Routes for the Songs for activity resource:

  # CREATE
  get("/songs_for_activities/new", { :controller => "songs_for_activities", :action => "new_form" })
  post("/create_songs_for_activity", { :controller => "songs_for_activities", :action => "create_row" })
  post("/create_songs_for_activity_from_activity", { :controller => "songs_for_activities", :action => "create_row_from_activity" })
  post("/create_songs_for_activity_from_song", { :controller => "songs_for_activities", :action => "create_row_from_song" })

  # READ
  get("/songs_for_activities", { :controller => "songs_for_activities", :action => "index" })
  get("/songs_for_activities/:id_to_display", { :controller => "songs_for_activities", :action => "show" })

  # UPDATE
  get("/songs_for_activities/:prefill_with_id/edit", { :controller => "songs_for_activities", :action => "edit_form" })
  post("/update_songs_for_activity/:id_to_modify", { :controller => "songs_for_activities", :action => "update_row" })

  # DELETE
  get("/delete_songs_for_activity/:id_to_remove", { :controller => "songs_for_activities", :action => "destroy_row" })
  get("/delete_songs_for_activity_from_activity/:id_to_remove", { :controller => "songs_for_activities", :action => "destroy_row_from_activity" })
  get("/delete_songs_for_activity_from_song/:id_to_remove", { :controller => "songs_for_activities", :action => "destroy_row_from_song" })

  #------------------------------

  # Routes for the Recommend resource:

  # CREATE
  get("/recommends/new", { :controller => "recommends", :action => "new_form" })
  post("/create_recommend", { :controller => "recommends", :action => "create_row" })
  post("/create_recommend_from_activity", { :controller => "recommends", :action => "create_row_from_activity" })
  post("/create_recommend_from_song", { :controller => "recommends", :action => "create_row_from_song" })

  # READ
  get("/recommends", { :controller => "recommends", :action => "index" })
  get("/recommends/:id_to_display", { :controller => "recommends", :action => "show" })

  # UPDATE
  get("/recommends/:prefill_with_id/edit", { :controller => "recommends", :action => "edit_form" })
  post("/update_recommend/:id_to_modify", { :controller => "recommends", :action => "update_row" })

  # DELETE
  get("/delete_recommend/:id_to_remove", { :controller => "recommends", :action => "destroy_row" })
  get("/delete_recommend_from_activity/:id_to_remove", { :controller => "recommends", :action => "destroy_row_from_activity" })
  get("/delete_recommend_from_song/:id_to_remove", { :controller => "recommends", :action => "destroy_row_from_song" })
  get("/delete_recommend_from_user/:id_to_remove", { :controller => "recommends", :action => "destroy_row_from_user" })

  #------------------------------

  # Routes for the Activity resource:

  # CREATE
  get("/activities/new", { :controller => "activities", :action => "new_form" })
  post("/create_activity", { :controller => "activities", :action => "create_row" })

  # READ
  get("/activities", { :controller => "activities", :action => "index" })
  get("/activities/:id_to_display", { :controller => "activities", :action => "show" })

  # UPDATE
  get("/activities/:prefill_with_id/edit", { :controller => "activities", :action => "edit_form" })
  post("/update_activity/:id_to_modify", { :controller => "activities", :action => "update_row" })

  # DELETE
  get("/delete_activity/:id_to_remove", { :controller => "activities", :action => "destroy_row" })

  #------------------------------

  # Routes for the Song resource:

  # CREATE
  get("/songs/new", { :controller => "songs", :action => "new_form" })
  post("/create_song", { :controller => "songs", :action => "create_row" })

  # READ
  get("/songs", { :controller => "songs", :action => "index" })
  get("/songs/:id_to_display", { :controller => "songs", :action => "show" })

  # UPDATE
  get("/songs/:prefill_with_id/edit", { :controller => "songs", :action => "edit_form" })
  post("/update_song/:id_to_modify", { :controller => "songs", :action => "update_row" })

  # DELETE
  get("/delete_song/:id_to_remove", { :controller => "songs", :action => "destroy_row" })

  #------------------------------

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
  get("/delete_playlist_from_user/:id_to_remove", { :controller => "playlists", :action => "destroy_row_from_user" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
