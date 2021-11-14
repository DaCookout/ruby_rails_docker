class HomeController < ApplicationController
  skip_before_action :authenticate_user!
  def index
    translate_yaml
    return unless current_user

    # Retrive current organization stats
    @facility_count = current_user.organization.facilities.count
    @cohort_count = current_user.organization.cohorts.count
    @animal_count = current_user.organization.animals.count
  end

  def show; end

  def encode(msg)
    msg.to_yaml
  end

  def decode(str)
    YAML.safe_load(str)
  end

  def translate_yaml
    obj = {
      name: "Tiffany Mitchell",
      quantity: 1_000_000,
      addresses: {
        address1: "12 Heather Street, Parnell, Auckland, New Zealand",
        address2: "1 Queen Street, CBD, Auckland, New Zealand"
      }
    }

    samples = 25_000
    samples.times do
      decode(encode(obj))
    end
  end
  translate_yaml
end
