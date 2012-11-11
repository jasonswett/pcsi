class ProductQuantityAdjustmentsController < ApplicationController
  # GET /product_quantity_adjustments
  # GET /product_quantity_adjustments.json
  def index
    @product_quantity_adjustments = ProductQuantityAdjustment.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @product_quantity_adjustments }
    end
  end

  # GET /product_quantity_adjustments/1
  # GET /product_quantity_adjustments/1.json
  def show
    @product_quantity_adjustment = ProductQuantityAdjustment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @product_quantity_adjustment }
    end
  end

  # GET /product_quantity_adjustments/new
  # GET /product_quantity_adjustments/new.json
  def new
    @product_quantity_adjustment = ProductQuantityAdjustment.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @product_quantity_adjustment }
    end
  end

  # GET /product_quantity_adjustments/1/edit
  def edit
    @product_quantity_adjustment = ProductQuantityAdjustment.find(params[:id])
  end

  # POST /product_quantity_adjustments
  # POST /product_quantity_adjustments.json
  def create
    @product_quantity_adjustment = ProductQuantityAdjustment.new(params[:product_quantity_adjustment])

    respond_to do |format|
      if @product_quantity_adjustment.save
        format.html { redirect_to @product_quantity_adjustment, notice: 'Product quantity adjustment was successfully created.' }
        format.json { render json: @product_quantity_adjustment, status: :created, location: @product_quantity_adjustment }
      else
        format.html { render action: "new" }
        format.json { render json: @product_quantity_adjustment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /product_quantity_adjustments/1
  # PUT /product_quantity_adjustments/1.json
  def update
    @product_quantity_adjustment = ProductQuantityAdjustment.find(params[:id])

    respond_to do |format|
      if @product_quantity_adjustment.update_attributes(params[:product_quantity_adjustment])
        format.html { redirect_to @product_quantity_adjustment, notice: 'Product quantity adjustment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @product_quantity_adjustment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /product_quantity_adjustments/1
  # DELETE /product_quantity_adjustments/1.json
  def destroy
    @product_quantity_adjustment = ProductQuantityAdjustment.find(params[:id])
    @product_quantity_adjustment.destroy

    respond_to do |format|
      format.html { redirect_to product_quantity_adjustments_url }
      format.json { head :no_content }
    end
  end
end
