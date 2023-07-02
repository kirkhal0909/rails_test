class ActualUsdRateChannel < ApplicationCable::Channel
  def subscribed
    stream_for CABLE_CHANNELS[:usd_rate]
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
