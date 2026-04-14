class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  private

  def event_store
    Rails.configuration.event_store
  end
end
