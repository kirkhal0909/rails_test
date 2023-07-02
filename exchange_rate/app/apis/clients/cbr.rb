module Clients
  class Cbr < BaseClient
    def exchange_rates(date)
      get('https://www.cbr.ru/scripts/XML_daily.asp', date_req: date)
    end
  end
end
