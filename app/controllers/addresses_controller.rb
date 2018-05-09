class AddressesController < ApplicationController
  before_action :set_adress, only: [:show, :edit, :update, :destroy]

  # GET /addresses
  # GET /addresses.json
  def index
    @adresses = Address.all
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
  end

  # GET /addresses/new
  def new
    @adress = Address.new
  end

  # GET /addresses/1/edit
  def edit
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @adress = Address.new(adress_params)

    respond_to do |format|
      if @adress.save
        format.html { redirect_to @adress, notice: 'Address was successfully created.' }
        format.json { render :show, status: :created, location: @adress }
      else
        format.html { render :new }
        format.json { render json: @adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /addresses/1
  # PATCH/PUT /addresses/1.json
  def update
    respond_to do |format|
      if @adress.update(adress_params)
        format.html { redirect_to @adress, notice: 'Address was successfully updated.' }
        format.json { render :show, status: :ok, location: @adress }
      else
        format.html { render :edit }
        format.json { render json: @adress.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @adress.destroy
    respond_to do |format|
      format.html { redirect_to addresses_url, notice: 'Address was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_adress
      @adress = Address.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def adress_params
      params.require(:adress).permit(:street, :city, :state, :contact_id)
    end
end
