class ApplicationPublisher

  # Publishing events looks like so:
  # def call
  #   <business logic that generates data for the event>
  #   event_store.publish(
  #     EventClass.new(data: <data for event>, <stream name>)
  #   )
  # end
  def call
    raise NotImplementedError, "You must explicitly implement #{self.class}##{__method__} for your Publisher class"
  end

  private

  def event_store
    Rails.configuration.event_store
  end
end
