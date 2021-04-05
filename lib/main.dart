import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:intl/intl.dart';

void main() => runApp(AgendaViewHeight());

class AgendaViewHeight extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AgendaHeight(),
    );
  }
}

class AgendaHeight extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => ScheduleExample();
}

List<String> size = <String>[ '50', '40', '30','20'];

class ScheduleExample extends State<AgendaHeight> {
  CalendarController _controller=CalendarController();
  List<Appointment>? appointmentDetails;
  double? height;

  @override
  void initState() {
    appointmentDetails = <Appointment>[];
    height = 0.0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
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
      body: Column(
        children: <Widget>[
          Expanded(
            child: SfCalendar(
              view: CalendarView.month,
              controller: _controller,
              dataSource: getCalendarDataSource(),
              monthViewSettings:
              MonthViewSettings(showAgenda: true, agendaViewHeight: height!),
            ),
          ),
        ],
      ),
    ));
  }

  _DataSource getCalendarDataSource() {
    final List<Appointment> appointments = <Appointment>[];
    appointments.add(Appointment(
      startTime: DateTime.now(),
      endTime: DateTime.now().add(const Duration(hours: 1)),
      subject: 'Meeting',
      color: Color(0xFFfb21f66),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -2, hours: 4)),
      endTime: DateTime.now().add(Duration(days: -2, hours: 5)),
      subject: 'Development Meeting   New York, U.S.A',
      color: Color(0xFFf527318),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -2, hours: 3)),
      endTime: DateTime.now().add(Duration(days: -2, hours: 4)),
      subject: 'Project Plan Meeting   Kuala Lumpur, Malaysia',
      color: Color(0xFFfb21f66),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -2, hours: 2)),
      endTime: DateTime.now().add(Duration(days: -2, hours: 3)),
      subject: 'Support - Web Meeting   Dubai, UAE',
      color: Color(0xFFf3282b8),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(Duration(days: -2, hours: 1)),
      endTime: DateTime.now().add(Duration(days: -2, hours: 2)),
      subject: 'Project Release Meeting   Istanbul, Turkey',
      color: Color(0xFFf2a7886),
    ));
    appointments.add(Appointment(
        startTime: DateTime.now().add(const Duration(hours: 4, days: -1)),
        endTime: DateTime.now().add(const Duration(hours: 5, days: -1)),
        subject: 'Release Meeting',
        color: Colors.lightBlueAccent,
        isAllDay: true));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 2, days: -4)),
      endTime: DateTime.now().add(const Duration(hours: 4, days: -4)),
      subject: 'Performance check',
      color: Colors.amber,
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 11, days: -2)),
      endTime: DateTime.now().add(const Duration(hours: 12, days: -2)),
      subject: 'Customer Meeting   Tokyo, Japan',
      color: Color(0xFFffb8d62),
    ));
    appointments.add(Appointment(
      startTime: DateTime.now().add(const Duration(hours: 6, days: 2)),
      endTime: DateTime.now().add(const Duration(hours: 7, days: 2)),
      subject: 'Retrospective',
      color: Colors.purple,
    ));

    return _DataSource(appointments);
  }

  IconData getIcon(String subject) {
    if (subject == 'Planning') {
      return Icons.subject;
    } else if (subject == 'Development Meeting   New York, U.S.A') {
      return Icons.people;
    } else if (subject == 'Support - Web Meeting   Dubai, UAE') {
      return Icons.settings;
    } else if (subject == 'Project Plan Meeting   Kuala Lumpur, Malaysia') {
      return Icons.check_circle_outline;
    } else if (subject == 'Retrospective') {
      return Icons.people_outline;
    } else if (subject == 'Project Release Meeting   Istanbul, Turkey') {
      return Icons.people_outline;
    } else if (subject == 'Customer Meeting   Tokyo, Japan') {
      return Icons.settings_phone;
    } else if (subject == 'Release Meeting') {
      return Icons.view_day;
    } else {
      return Icons.beach_access;
    }
  }
}

class _DataSource extends CalendarDataSource {
  _DataSource(List<Appointment> source) {
    appointments = source;
  }
}