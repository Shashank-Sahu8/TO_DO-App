import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:table_calendar/table_calendar.dart';

class calender extends StatefulWidget {
  const calender({super.key});

  @override
  State<calender> createState() => _calenderState();
}

class _calenderState extends State<calender> {

  DateTime _focusedDay =DateTime.now();
  CalendarFormat _calendarFormat =CalendarFormat.month;
  DateTime?_selectedDate;

  //
  // List<Event> _getEventsForDay(DateTime day) {
  //   return ;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffeebe6),
        appBar: AppBar(title: Text('Calendar Tasks',style: GoogleFonts.lato(color: Color(0xff03002e),fontWeight: FontWeight.w700,fontSize: 26),),backgroundColor: Color(0xfffeebe6),automaticallyImplyLeading: false,elevation: 1,shadowColor: Colors.white60,),
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 10,),
            TableCalendar(
              calendarStyle: CalendarStyle(canMarkersOverflow: false,),
              focusedDay: _focusedDay,
              firstDay: DateTime(2000),
              lastDay: DateTime(2050),
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDate, day);
              },
              onDaySelected: (selectedDay, focusedDay) {
                setState(() {
                  _selectedDate = selectedDay;
                  _focusedDay = focusedDay; // update `_focusedDay` here as well
                });
              },

              calendarFormat: _calendarFormat,
              onFormatChanged: (format) {
                setState(() {
                  _calendarFormat = format;
                });
              },

              onPageChanged: (focusedDay) {
                _focusedDay = focusedDay;
              },

              // eventLoader: (day) {
              //   return _getEventsForDay(day);
              // },

              locale: 'en_US',

            )
          ],
        )
      )
    );
  }
}
