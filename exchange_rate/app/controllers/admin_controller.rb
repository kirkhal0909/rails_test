class AdminController < ApplicationController
  def index; end

  def force_usd
    Interactors::Cbr::UpdateUsd.call({ force: true, usd_rate: params[:usd_rate].to_f, expires_in: params[:expires_in] })

    render json: { status: :ok }, status: :ok
  end
end
