import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';


  var months = {
    '1': "January",
    '2': "February",
    '3': "March",
    '4': "April",
    '5': "May",
    '6': "June",
    '7': "July",
    '8': "August",
    '9': "September",
    '10': "October",
    '11': "November",
    '12': "December",
  };

class CalendarNotes extends StatelessWidget {
  const CalendarNotes({super.key, required this.toNote});
  final Function()? toNote;

  @override
  Widget build(BuildContext context) {
    return SfCalendar(
      view: CalendarView.month,
      dataSource: MeetingDataSource(getDataSource()),
      monthViewSettings: const MonthViewSettings(
        appointmentDisplayMode: MonthAppointmentDisplayMode.appointment,
      ),
      onTap: (calendarTapDetails) {
        showModalBottomSheet(context: context, builder: (BuildContext context) {
          if(calendarTapDetails.date != null && calendarTapDetails.appointments != null){
            return Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 0,
                vertical: 8
              ),
              decoration: const BoxDecoration(
                borderRadius: BorderRadiusDirectional.vertical(
                  top: Radius.circular(15),
                )
              ),
              height: 200,
              child: Column(
                children: [
                  Text(getStringDate(calendarTapDetails.date as DateTime), style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 16),),
                  ListView.builder(
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(4),
                    itemCount: calendarTapDetails.appointments?.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        onTap: (){
                          toNote!.call();
                          inspect(index);
                        },
                        
                        // shape: RoundedRectangleBorder(
                        //   side: BorderSide(width: 2, color: calendarTapDetails.appointments?[index].background),
                        //   borderRadius: BorderRadius.circular(15),
                        // ),
                        leading: Container(
                          width: 8,
                          height: 8,
                          margin: const EdgeInsets.symmetric(
                            vertical: 4
                          ),
                          decoration: BoxDecoration(
                            color: calendarTapDetails.appointments?[index].background,
                            shape: BoxShape.circle
                          ),
                        ),
                        title: Text(calendarTapDetails.appointments?[index].eventName, style: const TextStyle(fontWeight: FontWeight.w500),),
                        subtitle: Text(calendarTapDetails.appointments?[index].from.toString() as String, style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 8),),
                        // tileColor: calendarTapDetails.appointments?[index].background,
                        
                        
                      );
                    }
                  ),
                ],
              )
            );
          }else{
            return const CircularProgressIndicator();
          }
        });
      },
    );
  }


  String getStringDate(DateTime dateTime){
    return (months[dateTime.month.toString()] as String) + " " + dateTime.day.toString() + ", " + dateTime.year.toString();
  }

  List<Meeting> getDataSource(){
    final DateTime today = DateTime(2023,9,19);
    final List<Meeting> meetings = <Meeting>[Meeting("Daily meeting", today, DateTime(today.year, today.month, today.day, today.hour, today.minute), Colors.deepOrange, false), Meeting("General meeting", today, DateTime(today.year, today.month, today.day, today.hour + 30, today.minute + 60), Colors.green, false)];
    inspect(meetings);
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  
  MeetingDataSource(List<Meeting> source){
    appointments = source;
  }

  @override
  DateTime getStartTime(int index){
    return getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return getMeetingData(index).isAllDay;
  }

  Meeting getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final Meeting meetingData;
    if (meeting is Meeting){
      meetingData = meeting;
    }
    return meetingData;
  }
}

class Meeting {
  Meeting(this.eventName, this.from, this.to, this.background, this.isAllDay);

  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}