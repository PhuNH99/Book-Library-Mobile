import 'package:flutter/material.dart';
import 'package:user_library/screen/shedule_screen/schedule_bloc.dart';
import 'package:user_library/screen/shedule_screen/schedule_event.dart';
import 'package:user_library/screen/shedule_screen/schedule_state.dart';
import 'package:user_library/screen/shedule_screen/widgets/cart_item.dart';

import 'widgets/view_all_schedule.dart';

class Schedule_Borrow_Book_Screen extends StatefulWidget {
  Schedule_Borrow_Book_Screen({Key key}) : super(key: key);

  @override
  _Schedule_Borrow_Book_ScreenState createState() =>
      _Schedule_Borrow_Book_ScreenState();
}

class _Schedule_Borrow_Book_ScreenState
    extends State<Schedule_Borrow_Book_Screen> {
  final txtSearch = TextEditingController();

  final schedule_bloc = ScheduleBloc();
  @override
  void initState() {
    super.initState();
    schedule_bloc.eventController.sink.add(FetchScheduleEvent());
  }

  @override
  Widget build(BuildContext context) {
    double wi = MediaQuery.of(context).size.width;
    double he = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(      
        title: Text(
          'Schedule',
          style: TextStyle(color: Colors.black87, fontSize: 28),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              print('cancel');
            },
            child: Icon(
              Icons.delete_forever,
              color: Color(0xFF545D68),
              size: 30,
            ),
          ),
        ],
        backgroundColor: Colors.purple,
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            color: Color(0xFF545D68),
            size: 30,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40), topRight: Radius.circular(40)),
            color: Color.fromRGBO(246, 246, 246, 1)),
        height: he,
        width: wi,
        child: Column(
          children: [
            Container(
                height: he - 143,
                margin: EdgeInsets.only(top: 5),
                child: StreamBuilder<ScheduleState>(
                  stream: schedule_bloc.stateController.stream,
                  initialData: schedule_bloc.state,
                  builder: (context, snapshot){
                    if(snapshot.hasError) return Text("Error");
                    return ViewAllSchedule(
                      schedules: snapshot.data.schedules,
                    );
                  }
                )),
          ],
        ),
      ),
    );
  }
}
