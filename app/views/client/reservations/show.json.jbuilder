json.array! @reservations do |reservation|
  
  json.name reservation.name
  json.start reservation.start
  json.end reservation.end
end