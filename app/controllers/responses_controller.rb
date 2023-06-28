class ResponsesController < ApplicationController
  protect_from_forgery
  before_action :set_response, only: [:show, :edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :destroy]

  # GET /responses
  # GET /responses.json
  def index
    if params[:id]
      @responses = Response.where(post_id: params[:id])
      @post = Post.find(params[:id])
    else
      @responses = Response.all
    end
    @response = Response.new
  end

  # GET /responses/1
  # GET /responses/1.json
  def show
  end

  # GET /responses/new
  def new
    @response = Response.new
  end

  # GET /responses/1/edit
  def edit
  end

  # POST /responses
  # POST /responses.json
  def create
    @response = Response.new(response_params)
    @response.latitude = Geocoder.search(@response.address)[0]
    respond_to do |format|
      if @response.save
        format.html { redirect_to "/posts/#{@response.post_id}/responses/index", notice: 'Response was successfully created.' }
        format.json { render :show, status: :created, location: @response }
        @notification = Notification.create(contributor_id: @response.user_id, content: "回答されました", state: "f", target_id: Post.joins(:responses).find_by(responses: { id: @response.post_id }).user_id, post_id: @response.post_id)
      else
        format.html { redirect_to "/posts/#{@response.post_id}/responses/index", notice: 'Creating was failed.' }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /responses/1
  # PATCH/PUT /responses/1.json
  def update
    @response = Response.find(params[:id])
    @response.longitude = nil
    @response.latitude = nil
    respond_to do |format|
      if @response.update(response_params)
        format.html { redirect_to "/posts/#{@response.post_id}/responses/index", notice: 'Response was successfully updated.' }
        format.json { render :show, status: :ok, location: @response }
      else
        format.html { render :edit }
        format.json { render json: @response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /responses/1
  # DELETE /responses/1.json
  def destroy
    @response.destroy
    respond_to do |format|
      format.html { redirect_to "/posts/#{@response.post_id}/responses/index", notice: 'Response was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def ba
    @response = Response.find(params[:id])
    @response.ba = true
    @notification = Notification.create(contributor_id: @response.user_id, content: "ベストアンサーに選ばれました", state: "f", target_id: Post.joins(:responses).find_by(responses: { id: @response.post_id }).user_id, post_id: @response.post_id)
    @response.save
    @post = Post.find(@response.post_id)
    @post.state = true
    @post.save
    redirect_to "/posts/#{@post.id}/responses/index"
  end
  
  def mymap
    @response = Response.find(params[:id])
    @mymap = Mymap.create(user_id: current_user.id, response_id: @response.id)
    redirect_to "/posts/#{Post.find(@response.post_id).id}/responses/index" ,notice: 'added'
    
  end
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_response
      @response = Response.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def response_params
      params.require(:response).permit(:name, :post_id, :ba, :address, :latitude, :longitude, :genre, :tag, :summary, :content, :user_id, :img)
    end
    
    def response_param
      params.require(:response).permit(:ba)
    end
    
    def correct_user
      if request.referer == nil
        redirect_to root_url
        flash[:notice] = "Please log in."
      end
    end
end
