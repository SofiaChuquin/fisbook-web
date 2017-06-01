class Api::V1::NotesController < ApiController
  def index
    notes = Note.all
    render notes.json
  end

  def create
  end

  def show
  end

  def update
  end

  def delete
  end
end 