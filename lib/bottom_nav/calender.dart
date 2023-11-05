import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class calender extends StatefulWidget {
  const calender({super.key});

  @override
  State<calender> createState() => _calenderState();
}

class _calenderState extends State<calender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffeebe6),
        appBar: AppBar(title: Text('Calendar Tasks',style: GoogleFonts.lato(color: Color(0xff03002e),fontWeight: FontWeight.w700,fontSize: 26),),backgroundColor: Color(0xfffeebe6),automaticallyImplyLeading: false,elevation: 1,shadowColor: Colors.white60,),
      body: SafeArea(
        child: SfCalendar(
        view: CalendarView.month,
        monthViewSettings: MonthViewSettings(showAgenda: true),
    ),
      )
    );
  }
}
