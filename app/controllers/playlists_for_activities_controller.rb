class PlaylistsForActivitiesController < ApplicationController
  def index
    @playlists_for_activities = PlaylistsForActivity.all

    render("playlists_for_activity_templates/index.html.erb")
  end

  def show
    @playlists_for_activity = PlaylistsForActivity.find(params.fetch("id_to_display"))

    render("playlists_for_activity_templates/show.html.erb")
  end

  def new_form
    @playlists_for_activity = PlaylistsForActivity.new

    render("playlists_for_activity_templates/new_form.html.erb")
  end

  def create_row
    @playlists_for_activity = PlaylistsForActivity.new

    @playlists_for_activity.activity_id = params.fetch("activity_id")
    @playlists_for_activity.playlist_id = params.fetch("playlist_id")

    if @playlists_for_activity.valid?
      @playlists_for_activity.save

      redirect_back(:fallback_location => "/playlists_for_activities", :notice => "Playlists for activity created successfully.")
    else
      render("playlists_for_activity_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @playlists_for_activity = PlaylistsForActivity.find(params.fetch("prefill_with_id"))

    render("playlists_for_activity_templates/edit_form.html.erb")
  end

  def update_row
    @playlists_for_activity = PlaylistsForActivity.find(params.fetch("id_to_modify"))

    @playlists_for_activity.activity_id = params.fetch("activity_id")
    @playlists_for_activity.playlist_id = params.fetch("playlist_id")

    if @playlists_for_activity.valid?
      @playlists_for_activity.save

      redirect_to("/playlists_for_activities/#{@playlists_for_activity.id}", :notice => "Playlists for activity updated successfully.")
    else
      render("playlists_for_activity_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @playlists_for_activity = PlaylistsForActivity.find(params.fetch("id_to_remove"))

    @playlists_for_activity.destroy

    redirect_to("/playlists_for_activities", :notice => "Playlists for activity deleted successfully.")
  end
end
