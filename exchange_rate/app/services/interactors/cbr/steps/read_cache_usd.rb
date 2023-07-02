module Interactors
  module Cbr
    module Steps
      class ReadCacheUsd < BaseInteractor
        def call
          context.usd_rate = CACHE.fetch(cache_key)

          fetch_data? ? context.usd_rate = nil : return_usd_rate
        end

        def return_usd_rate
          context.fail!
        end

        def fetch_data?
          context.force || context.usd_rate.blank?
        end
      end
    end
  end
end
