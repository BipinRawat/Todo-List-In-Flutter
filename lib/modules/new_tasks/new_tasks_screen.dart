import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/shared/components/task_item.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class NewTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).newTasks;
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          RichText(
                            text: TextSpan(
                                text: "W",
                                style: TextStyle(
                                    color: Colors.amber,
                                    fontSize: 45,
                                    fontFamily: 'Great Rebellion',
                                    fontWeight: FontWeight.w600),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: "hat's up ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: " T",
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 28,
                                        fontFamily: 'Great Rebellion',
                                        fontWeight: FontWeight.w600),
                                  ),
                                  TextSpan(
                                    text: "oday !",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ]),
                          ),
                          Divider(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 72.0),
                            child: RichText(
                                text: TextSpan(
                                    text: DateFormat("EEEE ")
                                        .format(DateTime.now()),
                                    style: TextStyle(
                                        color: Colors.amber,
                                        fontSize: 16,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w600),
                                    children: <TextSpan>[
                                  TextSpan(
                                    text: DateFormat("dd-MMM-yyyy")
                                        .format(DateTime.now()),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontFamily: 'Helvetica',
                                        fontWeight: FontWeight.w600),
                                  ),
                                ])),
                            // child: Text(
                            //   DateFormat("EEEE / dd-MMM-yyyy")
                            //       .format(DateTime.now()),
                            //   style: TextStyle(
                            //       color: Colors.amber,
                            //       fontWeight: FontWeight.bold,
                            //       fontSize: 15),
                            // ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.01,
                      ),
                      FlutterAnalogClock(
                        dateTime: DateTime.now(),
                        dialPlateColor: Colors.black,
                        hourHandColor: Colors.white,
                        minuteHandColor: Colors.white,
                        secondHandColor: Colors.white,
                        numberColor: Colors.amber,
                        borderColor: Colors.white,
                        tickColor: Colors.white,
                        centerPointColor: Colors.amber,
                        showBorder: true,
                        showTicks: true,
                        showMinuteHand: true,
                        showSecondHand: true,
                        showNumber: true,
                        borderWidth: 8.0,
                        hourNumberScale: 0.9,
                        hourNumbers: [
                          '1',
                          '2',
                          '3',
                          '4',
                          '5',
                          '6',
                          '7',
                          '8',
                          '9',
                          '10',
                          '11',
                          '12'
                        ],
                        isLive: true,
                        width: 120.0,
                        height: 120.0,
                        decoration: const BoxDecoration(),
                      ),
                    ],
                  ),
                ),
                // SizedBox(
                //   height: 10,
                // ),
                Padding(
                  padding: const EdgeInsets.only(left: 18),
                  child: tasks.length > 0
                      ? RichText(
                          text: TextSpan(
                              text: "New",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 22,
                                  fontFamily: 'NotoSans',
                                  fontWeight: FontWeight.w600),
                              children: <TextSpan>[
                                TextSpan(
                                  text: " Tasks",
                                  style: TextStyle(
                                      color: Colors.amber,
                                      fontSize: 20,
                                      fontFamily: 'Helvetica',
                                      fontWeight: FontWeight.w600),
                                )
                              ]),
                        )
                      : null,
                ),
                SizedBox(
                  height: 10,
                ),
                tasks.length > 0
                    ? Expanded(
                        child: SingleChildScrollView(
                          child: ListView.builder(
                              scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                //print(index);
                                return TaskItem(
                                  tasks: tasks[index],
                                );
                              },
                              itemCount: tasks.length),
                        ),
                      )
                    : SizedBox(
                        height: 450,
                        child: Lottie.asset(
                          'images/addTask.json',
                        ),
                      ),
              ],
            ),
          ),
        );
      },
    );
  }
}
