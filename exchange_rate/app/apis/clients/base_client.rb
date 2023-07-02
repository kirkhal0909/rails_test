module Clients
  class BaseClient
    include HTTParty

    def get(link, params = {})
      uri_params = params.present? ? "?#{URI.encode_www_form(params)}" : ''
      self.class.get("#{link}#{uri_params}")
    end
  end
end
