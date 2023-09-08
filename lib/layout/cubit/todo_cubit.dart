import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/dio_helper.dart';
import 'package:todo/layout/cubit/todo_states.dart';
import 'package:todo/models/task_model.dart';
import 'package:todo/models/user_model.dart';
import 'package:todo/modules/current_tasks_screen/current_tasks_screen.dart';
import 'package:todo/modules/done_tasks_screen/completed_tasks_screen.dart';

class TodoCubit extends Cubit<TodoStates> {
  TodoCubit(super.initialState);

  static TodoCubit get(context) => BlocProvider.of(context);

  int userId = 1;
  int currentIndex = 0;
  List<Widget> screensList = [
    CurrentTasksScreen(),
    CompletedTasksScreen(),
  ];
  List<Widget> titleList = [
    Text("Current Tasks",style: TextStyle(fontWeight: FontWeight.w500),),
    Text("Completed Tasks",style: TextStyle(fontWeight: FontWeight.w500 ),),
  ];

  // This method is used for managing BottomNavigationBar
  void changeBtmNavBar(index) {
    currentIndex = index;
    emit(ChangeBtmNavBarState());
  }


  //This method is used for fetching users data from API
 List<UserModel> usersList =[];
  Future<void> getUsers() async{
    emit(TodoGetUsersLoadingState());
    await DioHelper.getData(
        url: "https://jsonplaceholder.typicode.com/users")
        .then((value) {
          print(value.data);
          value.data.forEach((element){
            usersList.add(UserModel.fromJson(element));
          });
          print(usersList[8].name);
          emit(TodoGetUsersSuccessfulState());
    }).catchError((error){
      print(error.toString());
      emit(TodoGetUsersErrorState());
    });
  }


  List<TaskModel> tasksListFromJson =[];
  List<List<TaskModel>> taskList =[[]];
  //This method is used for fetching Tasks data from API
  void getTasks(){

    emit(TodoGetTasksLoadingState());
    print(taskList.length);
    DioHelper.getData(
        url: "https://jsonplaceholder.typicode.com/todos")
        .then((value) {
      // print(value.data);
      value.data.forEach((element){
        tasksListFromJson.add(TaskModel.fromJson(element));

      });




      // print(tasksList[8].completed);
      // print(userTasksList[0]);

      emit(TodoGetUsersTasksSuccessfulState());

    }).catchError((error){

      print(error.toString());

      emit(TodoGetUsersTasksErrorState());

    });
  }


  List<TaskModel> userTasksList =[]; /* This list contains all tasks for current selected user */
  //This method is used for get each user tasks
  Future<void> getUserTasks({
  required int userId,
}) async {
    userTasksList.clear();
       for (var task in tasksListFromJson) {
        if (task.userId == userId) {
          userTasksList.add(task);
      }
    }
      emit(TodoGetUserTasksState());
  }


  List<TaskModel> userUncompletedTasksList =[]; /* This list contains all uncompleted tasks for current selected user */
  //This method is used for separate uncompleted Tasks from userTasksList and set them to userUncompletedTasksList
  void getUserUncompletedTasks(){
    userUncompletedTasksList.clear();
    for (var task in userTasksList) {
      if (task.completed == false) {
        userUncompletedTasksList.add(task);
      }
    }
    emit(TodoGetUserUncompletedTasksState());
  }


  List<TaskModel> userCompletedTasksList =[]; /* This list contains all completed tasks for current selected user */
  //This method is used for separate completed Tasks from userTasksList and set them to userCompletedTasksList
  void getUserCompletedTasks(){
    userCompletedTasksList.clear();
    for (var task in userTasksList) {
      if (task.completed == true) {
        userCompletedTasksList.add(task);
      }
    }
    emit(TodoGetUserCompletedTasksState());
  }
}


