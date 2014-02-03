class ChatsController < ApplicationController
  before_action :set_chat, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, except: [:index, :show]

  # GET /chats
  # GET /chats.json
  def index
    if params[:category_id]
      @category = Category.friendly.find(params[:category_id])
      @chats = @category.chats
    else
      @chats = Chat.all
    end
  end

  # GET /chats/1
  # GET /chats/1.json
  def show
    if current_user
      @permission = ChatPolicy.new(current_user, @chat).user_chat?
    end
  end

  # GET /chats/new
  def new
    @chat = Chat.new
  end

  # GET /chats/1/edit
  def edit
    authorize @chat
  end

  # POST /chats
  # POST /chats.json
  def create
    @chat = current_user.chats.build(chat_params)
    authorize @chat
    respond_to do |format|
      if @chat.save
        format.html { redirect_to @chat, notice: 'Chat was successfully created.' }
        format.json { render action: 'show', status: :created, location: @chat }
      else
        format.html { render action: 'new' }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chats/1
  # PATCH/PUT /chats/1.json
  def update
    authorize @chat
    respond_to do |format|
      if @chat.update(chat_params)
        format.html { redirect_to @chat, notice: 'Chat was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @chat.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chats/1
  # DELETE /chats/1.json
  def destroy
    authorize @chat
    @chat.destroy
    respond_to do |format|
      format.html { redirect_to chats_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat
      @chat = Chat.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chat_params
      params.require(:chat).permit(:title, :url, :category_id, :image, :description)
    end
end
