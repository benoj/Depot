class ProducsController < ApplicationController
  # GET /producs
  # GET /producs.json
  def index
    @producs = Produc.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @producs }
    end
  end

  # GET /producs/1
  # GET /producs/1.json
  def show
    @produc = Produc.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @produc }
    end
  end

  # GET /producs/new
  # GET /producs/new.json
  def new
    @produc = Produc.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @produc }
    end
  end

  # GET /producs/1/edit
  def edit
    @produc = Produc.find(params[:id])
  end

  # POST /producs
  # POST /producs.json
  def create
    @produc = Produc.new(params[:produc])

    respond_to do |format|
      if @produc.save
        format.html { redirect_to @produc, notice: 'Produc was successfully created.' }
        format.json { render json: @produc, status: :created, location: @produc }
      else
        format.html { render action: "new" }
        format.json { render json: @produc.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /producs/1
  # PUT /producs/1.json
  def update
    @produc = Produc.find(params[:id])

    respond_to do |format|
      if @produc.update_attributes(params[:produc])
        format.html { redirect_to @produc, notice: 'Produc was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @produc.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /producs/1
  # DELETE /producs/1.json
  def destroy
    @produc = Produc.find(params[:id])
    @produc.destroy

    respond_to do |format|
      format.html { redirect_to producs_url }
      format.json { head :no_content }
    end
  end
end
