json.array! @reservations do |reservation|
  
  json.start reservation.start
  json.end_time reservation.end_time
end