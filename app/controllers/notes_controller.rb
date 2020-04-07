class NotesController < ApplicationController

  def index
    #pulls all notes from the DB
    notes = Note.all
    #renders all notes
    render json: notes, status: :ok
  end

  def create
    note = Note.create!(note_params)
    render json: notes, status: :ok
  end

  def note_params
    #looks for a notes object in our POST call. Then looks for a text parameter within the notes object, throwing error if it's missing
    params.require(:note).permit(:text)
  end
end
