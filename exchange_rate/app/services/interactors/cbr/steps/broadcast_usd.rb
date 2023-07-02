module Interactors
  module Cbr
    module Steps
      class BroadcastUsd < BaseInteractor
        def call
          ActualUsdRateChannel.broadcast_to(CABLE_CHANNELS[:usd_rate], usd_rate: context.usd_rate)
        end
      end
    end
  end
end
