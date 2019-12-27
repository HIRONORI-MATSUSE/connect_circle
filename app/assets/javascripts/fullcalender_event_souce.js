$(window).on("turbolinks:load", function() {
  if (document.querySelector("#patient_page")) {
    $("#calendar").fullCalendar({
      // eventSources: ["reservations.json"],
      header: {
        left: "today month,agendaDay ",
        center: "title",
        right: "prev next",
      },
      events: "/client/clinics/" + gon.clinic_id + "/reservations.json",
      timeFormat: "H:mm",
      defaultDate: $("#calendar").fullCalendar("today"),
      eventLimit: true, // allow "more" link when too many events
      // eventLimitText: "その他",
      lang: "ja",
      allDaySlot: false, // 終日表示の枠を表示するか
      // if current_user?
      // ドラックなどで編集ができる
      editable: true,
      eventDurationEditable: true, // イベント期間をドラッグしで変更するかどうか
      slotEventOverlap: false, // イベントを重ねて表示するか
      selectable: true,
      selectHelper: true,
      droppable: true, // イベントをドラッグできるかどうか
      dayPopoverFormat: "YYYY年 M月 D日[(]ddd[)]",
      firstDay: 1,
      weekends: true,
      slotDuration: "00:30:00",
      minTime: "07:00:00",
      maxTime: "20:00:00",
      businessHours: [
        {
          dow: [1, 2, 3, 4, 5],

          start: "08:30",
          end_time: "12:30",
        },
        {
          dow: [1, 2, 3, 4, 5], // Thursday, Friday
          start: "15:00", // 10am
          end_time: "19:00", // 4pm
        },
        {
          dow: [6], // Thursday, Friday
          start: "08:30", // 10am
          end_time: "13:00", // 4pm
        },
      ],
      //ドラッグしたら動くイベント
      select: function(start, end_time) {
        var formElement = document.getElementsByTagName("form")[0];
        var eventData;
        if (!start._ambigTime) {
          eventData = {
            name: name,
            start: start,
            end_time: end_time,
          };
          input1 = document.createElement("input");
          input2 = document.createElement("input");

          input1.type = "hidden";
          input1.value = eventData.start;
          input1.name = "reservation[start]";
          formElement.append(input1);

          input2.type = "hidden";
          input2.value = eventData.end_time;
          input2.name = "reservation[end_time]";
          formElement.append(input2);

          $("#calendar").fullCalendar("renderEvent", eventData, true); // stick? = true
        }
        $("#calendar").fullCalendar("unselect");
      },
      // クリックしたら起こるイベント
      dayClick: function(date, jsEvent, view) {
        $("#calendar").fullCalendar("gotoDate", date);
        $("#calendar").fullCalendar("changeView", "agendaDay");
      },
    });
  } else {
    $("#calendar").fullCalendar({
      // eventSources: ["reservations.json"],
      header: {
        left: "today month,agendaDay ",
        center: "title",
        right: "prev next",
      },
      events: "/staff/reservations/" + gon.clinic_id + ".json",
      timeFormat: "H:mm",
      defaultDate: $("#calendar").fullCalendar("today"),
      eventLimit: true, // allow "more" link when too many events
      // eventLimitText: "その他",
      lang: "ja",
      allDaySlot: false, // 終日表示の枠を表示するか
      editable: true,
      eventDurationEditable: true, // イベント期間をドラッグしで変更するかどうか
      slotEventOverlap: false, // イベントを重ねて表示するか
      selectable: true,
      selectHelper: true,
      droppable: true, // イベントをドラッグできるかどうか
      dayPopoverFormat: "YYYY年 M月 D日[(]ddd[)]",
      firstDay: 1,
      weekends: true,
      slotDuration: "00:30:00",
      minTime: "07:00:00",
      maxTime: "20:00:00",
      businessHours: [
        {
          dow: [1, 2, 3, 4, 5],
          start: "08:30",
          end_time: "12:30",
        },
        {
          dow: [1, 2, 3, 4, 5], // Thursday, Friday
          start: "15:00", // 10am
          end_time: "19:00", // 4pm
        },
        {
          dow: [6], // Thursday, Friday
          start: "08:30", // 10am
          end_time: "13:00", // 4pm
        },
      ],
      //ドラッグしたら動くイベント
      select: function(start, end_time) {
        var formElement = document.getElementsByTagName("form")[0];
        var eventData;
        if (!start._ambigTime) {
          eventData = {
            start: start,
            end_time: end_time,
          };
          input1 = document.createElement("input");
          input2 = document.createElement("input");

          input1.type = "hidden";
          input1.value = eventData.start;
          input1.name = "reservation[start]";
          formElement.append(input1);

          input2.type = "hidden";
          input2.value = eventData.end_time;
          input2.name = "reservation[end_time]";
          formElement.append(input2);
          debugger;
          $("#calendar").fullCalendar("renderEvent", eventData, true); // stick? = true
        }
        $("#calendar").fullCalendar("unselect");
      },
      // クリックしたら起こるイベント
      dayClick: function(date, jsEvent, view) {
        $("#calendar").fullCalendar("gotoDate", date);
        $("#calendar").fullCalendar("changeView", "agendaDay");
      },
    });
  }
});
