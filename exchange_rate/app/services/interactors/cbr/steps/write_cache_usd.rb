module Interactors
  module Cbr
    module Steps
      class WriteCacheUsd < BaseInteractor
        def call
          errors? ? write_errors(errors: 'usd_rate: blank') : CACHE.fetch(cache_key, options) { context.usd_rate }
        end

        def options
          {
            force: context.force,
            expires_in: expires_in || 15.minutes
          }.compact
        end

        def expires_in
          return if context.expires_in.blank?

          datetime = context.expires_in.to_datetime.in_time_zone - 3.hours
          now = Time.zone.now.in_time_zone
          datetime.to_i - now.to_i
        end

        def errors?
          context.usd_rate.blank?
        end
      end
    end
  end
end
