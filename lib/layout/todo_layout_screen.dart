import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/modules/current_tasks_screen/current_tasks_screen.dart';
import 'package:todo/layout/cubit/todo_states.dart';

import 'cubit/todo_cubit.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TodoCubit, TodoStates>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          floatingActionButton: Container(
            height: 55,
            width: 55,
            child: FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.mode_edit_outline_outlined,
                )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          extendBody: true,
          appBar: AppBar(
            title: TodoCubit.get(context)
                .titleList[TodoCubit.get(context).currentIndex],
          ),
          body: TodoCubit.get(context).screensList[TodoCubit.get(context).currentIndex],
          bottomNavigationBar: BottomNavigationBar(
            selectedItemColor: Theme.of(context).colorScheme.onSurface,
            elevation: 20,
            unselectedFontSize: 11,
            selectedFontSize: 13,
            currentIndex: TodoCubit.get(context).currentIndex,
            onTap: (index) {
              TodoCubit.get(context).changeBtmNavBar(index);
            },
            selectedLabelStyle: TextStyle(color: Colors.red),
            unselectedLabelStyle: TextStyle(color: Colors.grey),
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books_sharp),
                  label: "Current Tasks"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.done_outline_sharp),
                  label: "Completed Tasks"),
            ],
          ),
        );
      },
    );
  }
}

