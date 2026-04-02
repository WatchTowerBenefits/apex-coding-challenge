class ApplicationSubscriber
  # def call(event)
  #   data source = event.data.fetch(<identifier_for_data_source>)
  #   case event
  #   when ExpectedEventClass
  #     # notify someone...
  #   else
  #     raise "not supported event #{event.inspect}"
  #   end
  # end
  def call(event)
    raise NotImplementedError, "You must explicitly implement #{self.class}##{__method__} for your Notifier class"
  end

  private

  def event_store
    Rails.configuration.event_store
  end
end
