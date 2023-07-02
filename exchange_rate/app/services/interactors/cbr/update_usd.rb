module Interactors
  module Cbr
    class UpdateUsd
      include Interactor::Organizer

      organize Steps::WriteCacheUsd, Steps::BroadcastUsd
    end
  end
end
