$(window).on("load", () => {
  $("#calendar").fullCalendar({
    eventSources: ["/client/reservations.json"],

    // defau
    header: {
      left: "today month,agendaDay ",
      center: "title",
      right: "prev next",
    },
    defaultDate: "2019-12-12",
    eventLimit: true, // allow "more" link when too many events
    eventLimitText: "その他",
    lang: "ja",
    allDaySlot: false, // 終日表示の枠を表示するか
    // if current_user?
    editable: true, // イベントを編集するか
    eventDurationEditable: true, // イベント期間をドラッグしで変更するかどうか
    // else
    //   editable: false,
    //   eventDurationEditable: false,
    // end
    slotEventOverlap: false, // イベントを重ねて表示するか
    selectable: true,
    selectHelper: true,
    droppable: true, // イベントをドラッグできるかどうか
    dayPopoverFormat: "YYYY年 M月 D日[(]ddd[)]",
    // 月名称
    monthNames: [
      "1月",
      "2月",
      "3月",
      "4月",
      "5月",
      "6月",
      "7月",
      "8月",
      "9月",
      "10月",
      "11月",
      "12月",
    ],
    // 月略称
    monthNamesShort: [
      "1月",
      "2月",
      "3月",
      "4月",
      "5月",
      "6月",
      "7月",
      "8月",
      "9月",
      "10月",
      "11月",
      "12月",
    ],
    // 曜日名称
    dayNames: [
      "日曜日",
      "月曜日",
      "火曜日",
      "水曜日",
      "木曜日",
      "金曜日",
      "土曜日",
    ],
    // 曜日略称
    dayNamesShort: ["日", "月", "火", "水", "木", "金", "土"],
    // スロットの時間の書式
    axisFormat: "H:mm",
    // 時間の書式
    timeFormat: "H:mm",
    buttonText: {
      prev: "前",
      next: "次",
      prevYear: "前年",
      nextYear: "翌年",
      today: "今日",
      month: "月",
      week: "週",
      day: "日",
    },
    //月曜日開始
    firstDay: 1,
    //土日表示
    weekends: true,
    //agendaWeek、agendaDayの1時間4セル（15分間隔）で表示
    slotDuration: "00:30:00",
    //開始（終了）時間がない場合の設定
    defaultTimedEventDuration: "03:00:00",
    //スクロール開始時間
    scrollTime: "09:00:00",
    //スクロール時間の最大、最小の設定
    minTime: "07:00:00",
    maxTime: "20:00:00",
    views: {
      agendaDay: {
        type: "agenda",
        duration: { days: 1 },
      },
    },
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
      var eventData;
      if (!start._ambigTime) {
        var name = prompt("お名前をご記入ください(フルネーム)");
        eventData = {
          title: name,
          start: start,
          end: end,
        };
        $("#calendar").fullCalendar("renderEvent", eventData, true); // stick? = true
      }
      $("#calendar").fullCalendar("unselect");
    },
    dayClick: function(date, jsEvent, view) {
      $("#calendar").fullCalendar("gotoDate", date);
      $("#calendar").fullCalendar("changeView", "agendaDay");
    },
  });
});
