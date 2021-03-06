class PlaylistsController < ApplicationController
  before_action :current_user_must_be_playlist_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_playlist_user
    playlist = Playlist.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == playlist.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Playlist.ransack(params[:q])
    @playlists = @q.result(:distinct => true).includes(:user, :playlists_for_activities, :playlists_songs, :activities, :songs).page(params[:page]).per(10)

    render("playlist_templates/index.html.erb")
  end

  def show
    @playlists_song = PlaylistsSong.new
    @playlists_for_activity = PlaylistsForActivity.new
    @playlist = Playlist.find(params.fetch("id_to_display"))

    render("playlist_templates/show.html.erb")
  end

  def new_form
    @playlist = Playlist.new

    render("playlist_templates/new_form.html.erb")
  end

  def create_row
    @playlist = Playlist.new

    @playlist.description = params.fetch("description")
    @playlist.user_id = params.fetch("user_id")
    @playlist.playlist_name = params.fetch("playlist_name")
    @playlist.spotify_playlist_id = params.fetch("spotify_playlist_id")

    if @playlist.valid?
      @playlist.save

      redirect_back(:fallback_location => "/playlists", :notice => "Playlist created successfully.")
    else
      render("playlist_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @playlist = Playlist.find(params.fetch("prefill_with_id"))

    render("playlist_templates/edit_form.html.erb")
  end

  def update_row
    @playlist = Playlist.find(params.fetch("id_to_modify"))

    @playlist.description = params.fetch("description")
    
    @playlist.playlist_name = params.fetch("playlist_name")
    @playlist.spotify_playlist_id = params.fetch("spotify_playlist_id")

    if @playlist.valid?
      @playlist.save

      redirect_to("/playlists/#{@playlist.id}", :notice => "Playlist updated successfully.")
    else
      render("playlist_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @playlist = Playlist.find(params.fetch("id_to_remove"))

    @playlist.destroy

    redirect_to("/users/#{@playlist.user_id}", notice: "Playlist deleted successfully.")
  end

  def destroy_row
    @playlist = Playlist.find(params.fetch("id_to_remove"))

    @playlist.destroy

    redirect_to("/playlists", :notice => "Playlist deleted successfully.")
  end
end
