class DealDays
  # Define valid days of the week
  def self.valid_keys
      %w[Monday Tuesday Wednesday Thursday Friday Saturday Sunday].freeze
  end

  def self.to_select
    valid_keys.collect do |k|
      [ k.humanize, k ]
    end
  end

  def self.weekdays
    %w[Monday Tuesday Wednesday Thursday Friday].freeze
  end

  def self.weekends
    %w[Saturday Sunday].freeze
  end
end
