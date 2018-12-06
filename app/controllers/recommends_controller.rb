class RecommendsController < ApplicationController
  def index
    @recommends = Recommend.all

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

  def edit_form
    @recommend = Recommend.find(params.fetch("prefill_with_id"))

    render("recommend_templates/edit_form.html.erb")
  end

  def update_row
    @recommend = Recommend.find(params.fetch("id_to_modify"))

    @recommend.song_id = params.fetch("song_id")
    @recommend.user_id = params.fetch("user_id")
    @recommend.activity_id = params.fetch("activity_id")

    if @recommend.valid?
      @recommend.save

      redirect_to("/recommends/#{@recommend.id}", :notice => "Recommend updated successfully.")
    else
      render("recommend_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @recommend = Recommend.find(params.fetch("id_to_remove"))

    @recommend.destroy

    redirect_to("/recommends", :notice => "Recommend deleted successfully.")
  end
end
