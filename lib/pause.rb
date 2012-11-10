require "pause/version"
require "pause/configuration"
require "pause/action"
require "pause/analyzer"
require "pause/redis/adapter"

module Pause

  class PeriodCheck < Struct.new(:period_seconds, :max_allowed, :block_ttl)
    def <=>(other)
      self.period_seconds <=> other.period_seconds
    end
  end

  class SetElement < Struct.new(:ts, :count)
    def <=>(other)
      self.ts <=> other.ts
    end
  end

  class << self
    def analyzer
      @analyzer ||= Pause::Analyzer.new
    end

    def configure(&block)
      Pause::Configuration.configure(&block)
    end

    def config
      Pause::Configuration
    end
  end
end
