class PoemsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_poem, only: %i[ edit update destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  # GET /poems or /poems.json
  def index
    @poems = Poem.order(created_at: :desc)
  end

  # GET /poems/1 or /poems/1.json
  def show
    @poem = Poem.find(params[:id])
  end

  # GET /poems/new
  def new
    @poem = Poem.new
  end

  # GET /poems/1/edit
  def edit
  end

  # POST /poems or /poems.json
  def create
    @poem = current_user.poems.build(poem_params)

    respond_to do |format|
      if @poem.save
        format.html { redirect_to @poem, notice: "Poem was successfully created." }
        format.json { render :show, status: :created, location: @poem }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /poems/1 or /poems/1.json
  def update
    respond_to do |format|
      if @poem.update(poem_params)
        format.html { redirect_to @poem, notice: "Poem was successfully updated." }
        format.json { render :show, status: :ok, location: @poem }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @poem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /poems/1 or /poems/1.json
  def destroy
    @poem.destroy!

    respond_to do |format|
      format.html { redirect_to poems_path, status: :see_other, notice: "Poem was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_poem
      @poem = current_user.poems.find(params[:id])
    end

    def poem_params
      params.require(:poem).permit(:title, :aroma, :location, :content)
    end

    def authorize_user!
      redirect_to poems_path, alert: "権限がありません" unless @poem.user == current_user
    end
end
