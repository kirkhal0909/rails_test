module Interactors
  module Cbr
    module Steps
      class FetchUsd < BaseInteractor
        def call
          context.usd_rate = usd_rate

          write_errors(errors: 'usd_rate: blank') if context.usd_rate.blank?
        end

        def usd_rate
          @usd_rate ||= usd_row.present? ? usd_value / usd_nominal : nil
        end

        def usd_value
          usd_row[:Value]&.gsub(',', '.')&.to_f
        end

        def usd_nominal
          usd_row[:Nominal]&.to_f
        end

        def usd_row
          @usd_row ||= response.deep_symbolize_keys.dig(:ValCurs, :Valute)&.find { |row| row[:CharCode] == 'USD' }
        end

        def response
          client.exchange_rates(Date.today.strftime('%d.%m.%Y'))
        end

        def client
          Clients::Cbr.new
        end
      end
    end
  end
end
