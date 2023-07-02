CACHE = ActiveSupport::Cache::MemoryStore.new(size: 1.megabytes)

CACHE_KEYS = ExchangeRate::Application.config_for(:cache_keys)
