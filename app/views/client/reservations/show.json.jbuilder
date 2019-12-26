json.array! @reservations do |reservation|
  
  json.name reservation.name
  json.start reservation.start
  json.end_time reservation.end_time
end