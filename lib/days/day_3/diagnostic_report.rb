# frozen_string_literal: true

require 'days/day_3/helpers'

module Day3
  class DiagnosticReport
    attr_reader :lines

    def initialize(lines)
      @lines = lines
    end

    def gamma_rate
      Helpers.gamma_rate(lines)
    end

    def epsilon_rate
      Helpers.epsilon_rate(lines)
    end

    def oxygen_generator_rating
      Helpers.oxygen_generator_rating(lines)
    end

    def co2_scrubber_rating
      Helpers.co2_scrubber_rating(lines)
    end
  end
end
