class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all

    render("playlist_templates/index.html.erb")
  end

  def show
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
    @playlist.user_id = params.fetch("user_id")
    @playlist.playlist_name = params.fetch("playlist_name")
    @playlist.spotify_playlist_id = params.fetch("spotify_playlist_id")

    if @playlist.valid?
      @playlist.save

      redirect_to("/playlists/#{@playlist.id}", :notice => "Playlist updated successfully.")
    else
      render("playlist_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @playlist = Playlist.find(params.fetch("id_to_remove"))

    @playlist.destroy

    redirect_to("/playlists", :notice => "Playlist deleted successfully.")
  end
end
