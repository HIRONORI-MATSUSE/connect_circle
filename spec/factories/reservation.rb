FactoryBot.define do
  factory :reservation do
    name { '高木 沙織' }
    start { 'Date.today' }
    end_time { 'Date.today' }
  end
end