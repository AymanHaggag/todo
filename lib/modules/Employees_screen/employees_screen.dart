import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/layout/cubit/todo_cubit.dart';
import 'package:todo/layout/cubit/todo_states.dart';

import '../../layout/todo_layout_screen.dart';

class EmployeesScreen extends StatelessWidget {
  const EmployeesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: Icon(
              Icons.done_all_sharp,
              color: Colors.green,
            ),
            title: Text("Employees"),
          ),
          body: ConditionalBuilder(
              condition: (state is! TodoGetUsersLoadingState || state is! TodoGetTasksLoadingState ),
              builder: (context) => Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text("Press on any Employee to show tasks",style: TextStyle(color: Colors.grey),),
                    Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemBuilder: (context, index) => InkWell(
                          onTap: () async {
                            Navigator.push(context,
                                MaterialPageRoute(
                                    builder: (context) => LayoutScreen()));
                            await TodoCubit.get(context)
                                .getUserTasks(userId: index + 1);
                            TodoCubit.get(context).getUserUncompletedTasks();
                            TodoCubit.get(context).getUserCompletedTasks();
                            TodoCubit.get(context).userId = index;
                          },
                          child: Card(
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: CircleAvatar(
                                    radius: 41,
                                    backgroundColor: Colors.blue,
                                    child: CircleAvatar(
                                      radius: 40,
                                      backgroundImage: NetworkImage(
                                        "https://i.pinimg.com/564x/a9/8d/33/a98d336578c49bd121eeb9dc9e51174d.jpg",
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          "Name: ",
                                          style: TextStyle(color: Colors.black45,fontSize: 16),
                                        ),
                                        Text(
                                          TodoCubit.get(context).usersList[index].name as String,

                                          style: TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "Company: ",
                                          style: TextStyle(color: Colors.black45,fontSize: 16),
                                        ),
                                        Text(
                                          TodoCubit.get(context)
                                              .usersList[index]
                                              .company!
                                              .name as String,
                                          style: TextStyle(
                                              fontSize: 16,
                                              color: Colors.black
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        separatorBuilder: (context, index) => SizedBox(
                          height: 8,
                        ),
                        itemCount: TodoCubit.get(context).usersList.length,
                      ),
                    ),
                  ],
                ),
              ),
              fallback: (context) => const Center(child: CircularProgressIndicator())),
        );
      },
    );
  }
}
