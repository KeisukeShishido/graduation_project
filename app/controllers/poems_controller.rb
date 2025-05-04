class PoemsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_poem, only: %i[ edit update destroy ]
  before_action :authorize_user!, only: [ :edit, :update, :destroy ]

  def index
    @poems = Poem.order(created_at: :desc)
  end

  def show
    @poem = Poem.find(params[:id])
  end

  def new
    @poem = Poem.new
  end

  def edit
  end

  def create
    @poem = current_user.poems.build(poem_params)

    if @poem.save
        redirect_to @poem, notice: t('views.defaults.flash_message.created', item: Poem.model_name.human)
    else
        flash.now[:alert] = t('views.defaults.flash_message.not_created', item: Poem.model_name.human)
        render :new, status: :unprocessable_entity
    end
  end

  def update
    if @poem.update(poem_params)
        redirect_to @poem, notice: t('views.defaults.flash_message.updated', item: Poem.model_name.human)
    else
        flash.now[:alert] = t('views.defaults.flash_message.not_updated', item: Poem.model_name.human)
        render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @poem.destroy!
    redirect_to poems_path, notice: t('views.defaults.flash_message.destroyed', item: Poem.model_name.human)
  end

  private
    def set_poem
      @poem = current_user.poems.find_by(id: params[:id])
      unless @poem
        redirect_to poems_path, alert: t('views.defaults.flash_message.not_found', item: Poem.model_name.human)
    end
  end

    def poem_params
      params.require(:poem).permit(:title, :aroma, :location, :content)
    end

    def authorize_user!
      redirect_to poems_path, alert: "権限がありません" unless @poem.user == current_user
    end

end
