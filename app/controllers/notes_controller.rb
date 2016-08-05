class NotesController < ApplicationController
  before_action :check_login

  def create
    @note = Note.new(note_params)
    @note.author_id = current_user.id
    @note.save
    flash[:errors] = @note.errors.full_messages
    redirect_to track_url(@note.track_id)
  end

  def destroy
    @note = Note.find(params[:id])
    if @note.author_id != current_user.id
      flash.now[:errors] = @note.errors.full_messages
    else
      @note.destroy
      redirect_to track_url(@note.track_id)
    end
  end

  private

  def note_params
    params.require(:note).permit(:author_id, :track_id, :comment)
  end
end
