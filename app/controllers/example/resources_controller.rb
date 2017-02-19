class Example::ResourcesController < ApplicationController
  before_action :set_example_resource, only: [:show, :edit, :update, :destroy]

  # GET /example/resources
  # GET /example/resources.json
  def index
    @example_resources = Example::Resource.all
  end

  # GET /example/resources/1
  # GET /example/resources/1.json
  def show
  end

  # GET /example/resources/new
  def new
    @example_resource = Example::Resource.new
  end

  # GET /example/resources/1/edit
  def edit
  end

  # POST /example/resources
  # POST /example/resources.json
  def create
    @example_resource = Example::Resource.new(example_resource_params)

    respond_to do |format|
      if @example_resource.save
        format.html { redirect_to @example_resource, notice: 'Resource was successfully created.' }
        format.json { render :show, status: :created, location: @example_resource }
      else
        format.html { render :new }
        format.json { render json: @example_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /example/resources/1
  # PATCH/PUT /example/resources/1.json
  def update
    respond_to do |format|
      if @example_resource.update(example_resource_params)
        format.html { redirect_to @example_resource, notice: 'Resource was successfully updated.' }
        format.json { render :show, status: :ok, location: @example_resource }
      else
        format.html { render :edit }
        format.json { render json: @example_resource.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /example/resources/1
  # DELETE /example/resources/1.json
  def destroy
    @example_resource.destroy
    respond_to do |format|
      format.html { redirect_to example_resources_url, notice: 'Resource was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_example_resource
      @example_resource = Example::Resource.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def example_resource_params
      params.require(:example_resource).permit(:name)
    end
end
