# frozen_string_literal: true

class ApplicationService

  # Services are used both as logic for publishing and subscribing to events and require a #call method
  # service = ApplicationService.new
  # subscriber = ApplicationSubscriber.new
  #
  # event_store.within { service.call }.subscribe(subscriber, to: [ApplicationEvent]).call
  def call
    raise NotImplementedError, "You must implement #{self.class}##{__method__} for your Service class"
  end

  private

  def event_store
    Rails.configuration.event_store
  end
end

