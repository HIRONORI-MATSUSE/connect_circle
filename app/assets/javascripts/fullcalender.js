// $(function () {
//   $('#calendar-view').fullCalendar({
//     // full calendarをカスタマイズする際にここにオプションを記述する。
//   });
// })

//   $(document).on("turbolinks:load", function() {
//   var calendarEl = document.getElementById("calendar");
//   calendarEl.fullCalendar({
//     selectable: true,
//     header: {
//       left: "prev,next today",
//       center: "title",
//       right: "month,agendaWeek,agendaDay",
//     },
//     dayClick: function(date) {
//       alert("clicked " + date.format());
//     },
//     select: function(startDate, endDate) {
//       alert("selected " + startDate.format() + " to " + endDate.format());
//     },
//   });
// });

var initialize_calendar;
initialize_calendar = function() {
  // document.querySelector("#calendar").each(function() {
  // $(".calendar").each(function() {
  // var calendar = $(this);
  document.querySelector("#calendar").fullCalendar({
    header: {
      left: "prev,next today",
      center: "title",
      right: "month,agendaWeek,agendaDay",
    },
    selectable: true,
    selectHelper: true,
    editable: true,
    eventLimit: true,
    // events: "/events.json",

    // select: function(start, end) {
    //   $.getScript("/events/new", function() {});

    //   calendar.fullCalendar("unselect");
    // },

    // eventDrop: function(event, delta, revertFunc) {
    //   event_data = {
    //     event: {
    //       id: event.id,
    //       start: event.start.format(),
    //       end: event.end.format(),
    //     },
    //   };
    //   $.ajax({
    //     url: event.update_url,
    //     data: event_data,
    //     type: "PATCH",
    //   });
    // },

    // eventClick: function(event, jsEvent, view) {
    //   $.getScript(event.edit_url, function() {});
    // },
    // });
  });
};
document.addEventListener("DOMContentLoaded", initialize_calendar);
// $(document).on("turbolinks:load", initialize_calendar);
