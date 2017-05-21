class ExecutivesController < ApplicationController
  before_action :set_executive, only: [:show, :edit, :update, :destroy]

  # GET /executives
  # GET /executives.json
  def index
    @executives = Executive.all
  end

  # GET /executives/1
  # GET /executives/1.json
  def show
  end

  # GET /executives/new
  def new
    @executive = Executive.new
  end

  # GET /executives/1/edit
  def edit
  end

  # POST /executives
  # POST /executives.json
  def create
    @executive = Executive.new(executive_params)
    @executive.create_person(executive_params[:person_attributes])

    respond_to do |format|
      if @executive.save
        format.html { redirect_to @executive, notice: 'Executive was successfully created.' }
        format.json { render :show, status: :created, location: @executive }
      else
        format.html { render :new }
        format.json { render json: @executive.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /executives/1
  # PATCH/PUT /executives/1.json
  def update
    respond_to do |format|
      if @executive.update(executive_params)
        format.html { redirect_to @executive, notice: 'Executive was successfully updated.' }
        format.json { render :show, status: :ok, location: @executive }
      else
        format.html { render :edit }
        format.json { render json: @executive.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /executives/1
  # DELETE /executives/1.json
  def destroy
    @executive.destroy
    respond_to do |format|
      format.html { redirect_to executives_url, notice: 'Executive was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_executive
      @executive = Executive.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def executive_params
      params.require(:executive).permit(:position, person_attributes: [:lastname, :name, :dni, :phone, :email, :gender, :state, :rol])
    end
end
