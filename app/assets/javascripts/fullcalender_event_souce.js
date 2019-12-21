$(window).on("load", () => {
  $("#calendar").fullCalendar({
    eventSources: ["reservations.json"],

    header: {
      left: "today month,agendaDay ",
      center: "title",
      right: "prev next",
    },
    defaultDate: "2020-01-01",
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
        end: "12:30",
      },
      {
        dow: [1, 2, 3, 4, 5], // Thursday, Friday
        start: "15:00", // 10am
        end: "19:00", // 4pm
      },
      {
        dow: [6], // Thursday, Friday
        start: "08:30", // 10am
        end: "13:00", // 4pm
      },
    ],
    //ドラッグ後処理
    select: function(start, end) {
      var formElement = document.getElementsByTagName("form")[0];
      var eventData;
      if (!start._ambigTime) {
        var name = prompt("お名前をご記入ください(フルネーム)");
        eventData = {
          name: name,
          start: start,
          end: end,
        };

        input1 = document.createElement("input");
        input2 = document.createElement("input");
        input3 = document.createElement("input");

        input1.type = "hidden";
        input1.value = eventData.name;
        input1.name = "reservation[name]";
        formElement.append(input1);

        input2.type = "hidden";
        input2.value = eventData.start;
        input2.name = "reservation[start]";
        formElement.append(input2);

        input3.type = "hidden";
        input3.value = eventData.end;
        input3.name = "reservation[end]";
        formElement.append(input3);

        $("#calendar").fullCalendar("renderEvent", eventData, true); // stick? = true
      }
      $("#calendar").fullCalendar("unselect");
    },
    dayClick: function(date, jsEvent, view) {
      $("#calendar").fullCalendar("gotoDate", date);
      $("#calendar").fullCalendar("changeView", "agendaDay");
    },

    reservation: function() {
      $("form").submit(sample);

      function sample() {
        alert("送信しました！");
      }
    },
  });
});
