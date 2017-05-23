class PremiumSubscriptionsController < ApplicationController
  before_action :set_premium_subscription, only: [:show, :edit, :update, :destroy]
  before_action :store_xlsdata_requests, only: [:xlsdata]

  # GET /premium_subscriptions
  # GET /premium_subscriptions.json
  def index
    @premium_subscriptions = PremiumSubscription.all
  end

  # GET /premium_subscriptions/1
  # GET /premium_subscriptions/1.json
  def show
  end

  # GET /premium_subscriptions/new
  def new
    @premium_subscription = PremiumSubscription.new
  end

  # GET /premium_subscriptions/1/edit
  def edit
  end

  # GET /premium_subscriptions/xlsdata
  def xlsdata
    if request.format.xlsx?
      @premium_subscriptions = PremiumSubscription.query_results(params)
      render :status => 404 unless @premium_subscriptions.any?
    end

    respond_to do |format|
      format.html
      format.xlsx {
        response.headers['Content-Disposition'] = 'attachment; filename="subscription_report.xlsx"'
      }
    end
  end

  # POST /premium_subscriptions
  # POST /premium_subscriptions.json
  def create
    @premium_subscription = PremiumSubscription.new(premium_subscription_params)

    respond_to do |format|
      if @premium_subscription.save
        format.html { redirect_to @premium_subscription, notice: 'Premium subscription was successfully created.' }
        format.json { render :show, status: :created, location: @premium_subscription }
      else
        format.html { render :new }
        format.json { render json: @premium_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /premium_subscriptions/1
  # PATCH/PUT /premium_subscriptions/1.json
  def update
    respond_to do |format|
      if @premium_subscription.update(premium_subscription_params)
        format.html { redirect_to @premium_subscription, notice: 'Premium subscription was successfully updated.' }
        format.json { render :show, status: :ok, location: @premium_subscription }
      else
        format.html { render :edit }
        format.json { render json: @premium_subscription.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /premium_subscriptions/1
  # DELETE /premium_subscriptions/1.json
  def destroy
    @premium_subscription.destroy
    respond_to do |format|
      format.html { redirect_to premium_subscriptions_url, notice: 'Premium subscription was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_premium_subscription
      @premium_subscription = PremiumSubscription.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def premium_subscription_params
      params.require(:premium_subscription).permit(:shirt_size, :user_id, :subscription_length, :shipped, :shipping_address)
    end

    # Store the number of requests to the XLS decode in REDIS
    def store_xlsdata_requests
      #TODO Add redis.incr "xlsdata_count"
    end
end
