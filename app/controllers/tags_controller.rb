class TagsController < ApplicationController
  load_and_authorize_resource :except => :create
  before_action :set_tag, only: [:edit, :update, :destroy]

  # GET /tags
  # GET /tags.json
  def index
    @tags = Tag.where(customer_id: current_user.customer.id)
  end

  # GET /tags/new
  def new
    @tag = Tag.new
  end

  # GET /tags/1/edit
  def edit
  end

  # POST /tags
  # POST /tags.json
  def create
    @tag = Tag.new(tag_params)
    @tag.customer = current_user.customer

    respond_to do |format|
      if @tag.save
        format.html { redirect_to tags_path, notice: t('activerecord.successful.messages.created', model: @tag.class.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'new' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tags/1
  # PATCH/PUT /tags/1.json
  def update
    respond_to do |format|
      if @tag.update(tag_params)
        format.html { redirect_to tags_path, notice: t('activerecord.successful.messages.updated', model: @tag.class.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tags/1
  # DELETE /tags/1.json
  def destroy
    @tag.destroy
    respond_to do |format|
      format.html { redirect_to tags_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tag
      @tag = Tag.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tag_params
      params.require(:tag).permit(:label)
    end
end
