require 'bike_container_test_spec.rb'
require 'bike_container.rb'
require 'support/shared_examples_for_bike_container.rb'

class BikeContainerTest
  include BikeContainer
end

describe BikeContainerTest do
  # it_behaves_like BikeContainer
  include_examples BikeContainer
end
