class RecommendsController < ApplicationController
  before_action :current_user_must_be_recommend_user, :only => [:edit_form, :update_row, :destroy_row]

  def current_user_must_be_recommend_user
    recommend = Recommend.find(params["id_to_display"] || params["prefill_with_id"] || params["id_to_modify"] || params["id_to_remove"])

    unless current_user == recommend.user
      redirect_to :back, :alert => "You are not authorized for that."
    end
  end

  def index
    @q = Recommend.ransack(params[:q])
    @recommends = @q.result(:distinct => true).includes(:user, :song, :activity).page(params[:page]).per(10)

    render("recommend_templates/index.html.erb")
  end

  def show
    @recommend = Recommend.find(params.fetch("id_to_display"))

    render("recommend_templates/show.html.erb")
  end

  def new_form
    @recommend = Recommend.new

    render("recommend_templates/new_form.html.erb")
  end

  def create_row
    @recommend = Recommend.new

    @recommend.song_id = params.fetch("song_id")
    @recommend.user_id = params.fetch("user_id")
    @recommend.activity_id = params.fetch("activity_id")

    if @recommend.valid?
      @recommend.save

      redirect_back(:fallback_location => "/recommends", :notice => "Recommend created successfully.")
    else
      render("recommend_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_song
    @recommend = Recommend.new

    @recommend.song_id = params.fetch("song_id")
    @recommend.user_id = params.fetch("user_id")
    @recommend.activity_id = params.fetch("activity_id")

    if @recommend.valid?
      @recommend.save

      redirect_to("/songs/#{@recommend.song_id}", notice: "Recommend created successfully.")
    else
      render("recommend_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_activity
    @recommend = Recommend.new

    @recommend.song_id = params.fetch("song_id")
    @recommend.user_id = params.fetch("user_id")
    @recommend.activity_id = params.fetch("activity_id")

    if @recommend.valid?
      @recommend.save

      redirect_to("/activities/#{@recommend.activity_id}", notice: "Recommend created successfully.")
    else
      render("recommend_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @recommend = Recommend.find(params.fetch("prefill_with_id"))

    render("recommend_templates/edit_form.html.erb")
  end

  def update_row
    @recommend = Recommend.find(params.fetch("id_to_modify"))

    @recommend.song_id = params.fetch("song_id")
    
    @recommend.activity_id = params.fetch("activity_id")

    if @recommend.valid?
      @recommend.save

      redirect_to("/recommends/#{@recommend.id}", :notice => "Recommend updated successfully.")
    else
      render("recommend_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @recommend = Recommend.find(params.fetch("id_to_remove"))

    @recommend.destroy

    redirect_to("/users/#{@recommend.user_id}", notice: "Recommend deleted successfully.")
  end

  def destroy_row_from_song
    @recommend = Recommend.find(params.fetch("id_to_remove"))

    @recommend.destroy

    redirect_to("/songs/#{@recommend.song_id}", notice: "Recommend deleted successfully.")
  end

  def destroy_row_from_activity
    @recommend = Recommend.find(params.fetch("id_to_remove"))

    @recommend.destroy

    redirect_to("/activities/#{@recommend.activity_id}", notice: "Recommend deleted successfully.")
  end

  def destroy_row
    @recommend = Recommend.find(params.fetch("id_to_remove"))

    @recommend.destroy

    redirect_to("/recommends", :notice => "Recommend deleted successfully.")
  end
end
