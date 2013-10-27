# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :station do
    station_id 26799
    name "My Apartment"
    location [-74.03189,40.73020]
  end
end
