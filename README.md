# Agenda view height customization in flutter event calendar (SfCalendar)
In the flutter event calendar, you can customize the agenda view height using the `agendaViewHeight` property of `MonthViewSettings` in the calendar widget.

**Refer:** https://www.syncfusion.com/kb/11013/how-to-customize-agenda-view-height-based-on-the-flutter-event-calendar-widget-height

## Step 1:
In initState(), set the default values for calendar view, agenda view height.

```xml
CalendarView _calendarView;
List<Appointment> appointmentDetails;
double height;
 
@override
void initState() {
  appointmentDetails = <Appointment>[];
  _calendarView = CalendarView.month;
  height = 0.0;
  super.initState();
}
```
 

## Step 2:
Use the `MediaQuery` widget to get the height of the device. You can customize the agenda view height based on the height value from the `PopupMenuItem`.
```xml
appBar: AppBar(
  actions: <Widget>[
    PopupMenuButton<String>(
      icon: Icon(Icons.settings),
      itemBuilder: (BuildContext context) {
        return size.map((String choice) {
          return PopupMenuItem<String>(
            value: choice,
            child: Text('$choice',),
          );
        }).toList();
      },
      onSelected: (String value) {
        setState(() {
          if (value == '50') {
            height = MediaQuery.of(context).size.height/2;
          } else if (value == '40') {
            height = MediaQuery.of(context).size.height/3;
          } else if (value == '30') {
            height = MediaQuery.of(context).size.height/4;
          } else if (value == '20') {
            height = MediaQuery.of(context).size.height/5;
          }
        });
      },
    ),
  ],
),
```
 

## Step 3:
Select the height value from the `PopupMenuItem` and assign the height value to the `agendaViewHeight` of `MonthViewSettings` of the calendar widget.
```xml
body: Column(
  children: <Widget>[
    Expanded(
      child: SfCalendar(
        view: _calendarView,
        dataSource: getCalendarDataSource(),
        monthViewSettings:
            MonthViewSettings(showAgenda: true, agendaViewHeight: height),
      ),
    ),
  ],
),
```
