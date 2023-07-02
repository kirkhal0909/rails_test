module Interactors
  module Cbr
    class ReadOrFetchUsd
      include Interactor::Organizer

      organize Steps::ReadCacheUsd, Steps::FetchUsd, UpdateUsd
    end
  end
end
