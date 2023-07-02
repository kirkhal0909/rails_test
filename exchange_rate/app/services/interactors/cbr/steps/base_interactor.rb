module Interactors
  module Cbr
    module Steps
      class BaseInteractor
        include Interactor

        def write_errors(info = {})
          context.fail!(**info, class: self.class)
        end

        def cache_key
          CACHE_KEYS[:usd_rate]
        end
      end
    end
  end
end
