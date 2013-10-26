require 'spec_helper'

describe Station do
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:location) }
  it { should validate_uniqueness_of(:name) }
  it { should validate_uniqueness_of(:location) }
end
