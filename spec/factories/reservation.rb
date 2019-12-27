FactoryBot.define do
  factory :reservation do
    start { 'Date.parse("2020-01-03 012:00:00")' }
    end_time { 'Date.parse("2020-01-03 013:00:00")' }
  end

  factory :second_reservation, class: Reservation do
    start { Date.today }
    end_time { Date.today }
  end
end