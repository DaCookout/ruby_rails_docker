require "pyroscope"

class ApplicationJob < ActiveJob::Base
  around_perform :add_pyroscope

  private

  # rubocop:disable Style/ExplicitBlockArgument
  def add_pyroscope
    tags = {
      "job_class": self.class.name,
      "job_id": job_id
    }

    Pyroscope.tag_wrapper(tags) do
      yield
    end
  end
  # rubocop:enable Style/ExplicitBlockArgument
end
