class NotesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_note, only: %i[ show edit update destroy] # set_note makes new, edit, and update empty
  before_action :set_label

  # GET /notes or /notes.json
  def index
    # @notes = Note.all
    @notes = current_user.notes.all
  end

  # GET /notes or /notes.json with deadlines
  def timed
    @notes_timed = []
    @notes = current_user.notes.all.reverse_each
    @notes.each do |note|
        if note.deadline && note.deadline.today?
            @notes_timed.push(note)
        end
    end
    @notes_timed
  end

  # GET /notes/1 or /notes/1.json
  def show
    # @note = Note.find(params[:id])
    @note = current_user.notes.find(params[:id])
  end

  # GET /notes/new
  def new
    @note = Note.new
  end

  # GET /notes/1/edit
  def edit
    @current_label = @note.label
  end

  # POST /notes or /notes.json
  def create
    @note = Note.new(note_params)
    @note.user = current_user

    respond_to do |format|
      if @note.save
        format.html { redirect_to note_url(@note), notice: "Note was successfully created." }
        format.json { render :show, status: :created, location: @note }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /notes/1 or /notes/1.json
  def update
    respond_to do |format|
      if @note.update(note_params)
        format.html { redirect_to note_url(@note), notice: "Note was successfully updated." }
        format.json { render :show, status: :ok, location: @note }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @note.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /notes/1 or /notes/1.json
  def destroy
    @note.destroy

    respond_to do |format|
      format.html { redirect_to notes_url, notice: "Note was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_note
      @note = current_user.notes.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def note_params
      params.require(:note).permit(:head, :body, :deadline, :label_id)
    end

    # Define labels to be displayed for label setting of notes.
    def set_label
      @labels = current_user.labels.all.order(:title)
    end

end
