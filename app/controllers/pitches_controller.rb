class PitchesController < ApplicationController
  def index
    matching_pitches = Pitch.all

    @list_of_pitches = matching_pitches.order({ :created_at => :desc })

    render({ :template => "pitches/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_pitches = Pitch.where({ :id => the_id })

    @the_pitch = matching_pitches.at(0)

    @matching_posts = Post.where({ :pitch_id => @the_pitch.id })

    render({ :template => "pitches/show" })
  end

  def create
    the_pitch = Pitch.new
    the_pitch.address = params.fetch("query_address")
    the_pitch.name = params.fetch("query_name")
    the_pitch.user_id = params.fetch("query_user_id")
    the_pitch.image = params.fetch("query_image")

    if the_pitch.valid? #and current_user.present?
      the_pitch.save
      redirect_to("/pitches", { :notice => "Pitch created successfully." })
    else
      redirect_to("/pitches", { :alert => the_pitch.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_pitch = Pitch.where({ :id => the_id }).at(0)

    the_pitch.address = params.fetch("query_address")
    the_pitch.name = params.fetch("query_name")
    the_pitch.user_id = params.fetch("query_user_id")
    the_pitch.image = params.fetch("query_image")

    if the_pitch.valid?
      the_pitch.save
      redirect_to("/pitches/#{the_pitch.id}", { :notice => "Pitch updated successfully."} )
    else
      redirect_to("/pitches/#{the_pitch.id}", { :alert => the_pitch.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_pitch = Pitch.where({ :id => the_id }).at(0)

    the_pitch.destroy

    redirect_to("/pitches", { :notice => "Pitch deleted successfully."} )
  end
end
