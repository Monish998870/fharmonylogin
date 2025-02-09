import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../components/no_data.dart';
import '../controllers/calendar_controller.dart';

class CalendarView extends GetView<CalendarController> {
  const CalendarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(
    automaticallyImplyLeading: false,
  title: Text('Calendar', style: context.theme.textTheme.displaySmall),
  centerTitle: true,
  ),
  body:  CalendarPage(),
  );
  }
}

class CalendarPage extends StatefulWidget {
  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late final ValueNotifier<List<DateTime>> _selectedDays;
  late final Map<DateTime, List<Event>> _events;
  late final Map<DateTime, Color> _dayColors;

  @override
  void initState() {
    super.initState();
    _selectedDays = ValueNotifier([]);
    _events = {};
    _dayColors = {}; // Initialize an empty map for day colors
  }

  @override
  Widget build(BuildContext context) {
    var theme = context.theme;
    return Scaffold(
      //appBar: AppBar(
        //title: Text('Simple Calendar'),
      //),
      body: Column(
        children: [
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: DateTime.now(),
            selectedDayPredicate: (day) {
              return _selectedDays.value.contains(day);
            },
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: theme.primaryColor,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
              defaultDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              weekendDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
              outsideDecoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.transparent,
              ),
            ),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                if (_selectedDays.value.contains(selectedDay)) {
                  _selectedDays.value.remove(selectedDay);
                } else {
                  _selectedDays.value.add(selectedDay);
                }
              });
            },
            calendarBuilders: CalendarBuilders(
              defaultBuilder: (context, day, focusedDay) {
                final color = _dayColors[day];
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    color: color ?? Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${day.day}',
                      style: TextStyle(
                        color: color != null ? Colors.white : Colors.black,
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          //ElevatedButton(
            //onPressed: () {
              //setState(() {
                //for (var day in _selectedDays.value) {
                  //_dayColors[day] = Colors.green; // Change color of selected days
                //}
              //});
            //},
            //child: Text(''),
         // ),
        ],
      ),
    );
  }
}

class Event {}