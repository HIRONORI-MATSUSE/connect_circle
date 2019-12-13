$(window).on("load", () => {
  $("#calendar").fullCalendar({
    eventSources: ["/client/reservations"],
  });
});
