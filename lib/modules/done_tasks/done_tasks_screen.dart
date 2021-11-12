import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_app/shared/components/task_item.dart';
import 'package:todo_app/shared/cubit/cubit.dart';
import 'package:todo_app/shared/cubit/states.dart';

class DoneTasksScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
        var tasks = AppCubit.get(context).doneTasks;
        return SafeArea(
          child: SingleChildScrollView(
            physics:
                BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            child: Container(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child:
                    RichText(
                      text: TextSpan(
                          text: "C",
                          style: TextStyle(
                              color: Colors.amber,
                              fontSize: 45,
                              fontFamily: 'Great Rebellion',
                              fontWeight: FontWeight.w600
                          ),
                          children: <TextSpan> [
                            TextSpan(
                              text: "ompleted  ",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            TextSpan(
                              text: "T",
                              style: TextStyle(
                                  color: Colors.amber,
                                  fontSize: 40,
                                  fontFamily: 'Great Rebellion',
                                  fontWeight: FontWeight.w600
                              ),
                            ),
                            TextSpan(
                              text: "asks",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 35,
                                  fontFamily: 'Helvetica',
                                  fontWeight: FontWeight.w600
                              ),
                            )
                          ]
                      ),

                    )
                  ),
                  // SizedBox(
                  //   height: 10,
                  // ),
                  SizedBox(
                    height: 30,
                  ),
                  tasks.length > 0
                      ?
                  Expanded(
                    child: SingleChildScrollView(
                      child: ListView.builder(
                              //scrollDirection: Axis.vertical,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                //print(index);
                                return TaskItem(
                                  tasks: tasks[index],
                                );
                              },
                              // separatorBuilder: (context, index) => Padding(
                              //       padding: const EdgeInsets.only(left: 20),
                              //       child: Container(
                              //         width: double.infinity,
                              //         height: 1.0,
                              //         color: Colors.grey[200],
                              //       ),
                              //     ),
                              itemCount: tasks.length),
                    ),
                  )
                      :
                  SizedBox(
                    height: 600,
                        child: Lottie.asset('images/doneTask.json',
                            height: 200
                          //     Image.asset(
                          // 'images/nodata2.png',
                        ),
                      ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
