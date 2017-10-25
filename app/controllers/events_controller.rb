class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :correct_user, only: [:edit, :update, :destroy]

  def index
    if user_signed_in?
      @event = Event.new
      @events = current_user.events.where("dead >= ?", Date.today)
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      flash[:success] = "イベントが作成されました"
      redirect_to root_url
    else
      flash.now[:danger] = "イベントが作成されませんでした"
      render 'new'
    end
  end

  def edit
  end

  def update
    if @event.update_attributes(event_params)
      flash[:success] = "イベントの編集が完了しました"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event.destroy
    flash[:success] = "イベントを削除しました"
    redirect_to root_url
  end

  private
    def event_params
      params.require(:event).permit(:content, :dead, :user_id)
    end

    def correct_user
      @event = Event.find(params[:id])
      @user = User.find(@event.user_id)
      redirect_to(root_url) unless @user == current_user
    end
end
