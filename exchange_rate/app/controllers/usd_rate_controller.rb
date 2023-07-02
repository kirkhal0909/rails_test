class UsdRateController < ApplicationController
  before_action :prepare_result

  def index
    @usd_rate = @result.usd_rate
  end

  def get
    return render json: { message: 'some error' }, status: :service_unavailable if @result.errors.present?

    render json: { usd_rate: @result.usd_rate }, status: :ok
  end

  private

  def prepare_result
    @result = Interactors::Cbr::ReadOrFetchUsd.call
  end
end
