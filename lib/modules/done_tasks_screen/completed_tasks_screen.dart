import 'package:flutter/material.dart';
import 'package:todo/layout/cubit/todo_cubit.dart';


class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 41,
                      backgroundColor: Colors.blue,
                      child: CircleAvatar(
                        radius: 40,
                        backgroundImage: NetworkImage(
                          "https://i.pinimg.com/564x/a9/8d/33/a98d336578c49bd121eeb9dc9e51174d.jpg",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Name: ",
                              style: TextStyle(color: Colors.black45),
                            ),
                            Text(
                              TodoCubit.get(context)
                                  .usersList[TodoCubit.get(context).userId]
                                  .name as String,
                              style: TextStyle(
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Company: ",
                              style: TextStyle(color: Colors.black45),
                            ),
                            Text(
                              TodoCubit.get(context)
                                  .usersList[TodoCubit.get(context).userId]
                                  .company!
                                  .name as String,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "E-Mail: ",
                              style: TextStyle(color: Colors.black45),
                            ),
                            Text(
                              TodoCubit.get(context)
                                  .usersList[TodoCubit.get(context).userId]
                                  .email as String,
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Address: ",
                              style: TextStyle(color: Colors.black45),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                            Text(
                              "${TodoCubit.get(context).usersList[TodoCubit.get(context).userId].address!.street}, ${TodoCubit.get(context).usersList[TodoCubit.get(context).userId].address!.city}",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Phone: ",
                              style: TextStyle(color: Colors.black45),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                            Text(
                              "${TodoCubit.get(context).usersList[TodoCubit.get(context).userId].phone}",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Website: ",
                              style: TextStyle(color: Colors.black45),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              softWrap: false,
                            ),
                            Text(
                              "${TodoCubit.get(context).usersList[TodoCubit.get(context).userId].website}",
                              style:
                                  TextStyle(fontSize: 15, color: Colors.black),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              child: ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) => Card(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Icon(
                                Icons.done_outline_rounded,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Expanded(
                                // width: MediaQuery.of(context).size.width,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Text(
                                    TodoCubit.get(context)
                                        .userCompletedTasksList[index]
                                        .title as String,
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        height: 5,
                      ),
                  itemCount:
                      TodoCubit.get(context).userCompletedTasksList.length),
            ),
          ],
        ),
      ),
    );
  }
}
