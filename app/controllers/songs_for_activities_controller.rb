class SongsForActivitiesController < ApplicationController
  def index
    @songs_for_activities = SongsForActivity.all

    render("songs_for_activity_templates/index.html.erb")
  end

  def show
    @songs_for_activity = SongsForActivity.find(params.fetch("id_to_display"))

    render("songs_for_activity_templates/show.html.erb")
  end

  def new_form
    @songs_for_activity = SongsForActivity.new

    render("songs_for_activity_templates/new_form.html.erb")
  end

  def create_row
    @songs_for_activity = SongsForActivity.new

    @songs_for_activity.song_id = params.fetch("song_id")
    @songs_for_activity.activity_id = params.fetch("activity_id")

    if @songs_for_activity.valid?
      @songs_for_activity.save

      redirect_back(:fallback_location => "/songs_for_activities", :notice => "Songs for activity created successfully.")
    else
      render("songs_for_activity_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @songs_for_activity = SongsForActivity.find(params.fetch("prefill_with_id"))

    render("songs_for_activity_templates/edit_form.html.erb")
  end

  def update_row
    @songs_for_activity = SongsForActivity.find(params.fetch("id_to_modify"))

    @songs_for_activity.song_id = params.fetch("song_id")
    @songs_for_activity.activity_id = params.fetch("activity_id")

    if @songs_for_activity.valid?
      @songs_for_activity.save

      redirect_to("/songs_for_activities/#{@songs_for_activity.id}", :notice => "Songs for activity updated successfully.")
    else
      render("songs_for_activity_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @songs_for_activity = SongsForActivity.find(params.fetch("id_to_remove"))

    @songs_for_activity.destroy

    redirect_to("/songs_for_activities", :notice => "Songs for activity deleted successfully.")
  end
end
