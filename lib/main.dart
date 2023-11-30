//Flutter Imports:
import 'package:flutter/material.dart';

//Packages Imports:
import 'package:flutter_bloc/flutter_bloc.dart';

//Project Imports:
import 'modules/Employees_screen/employees_screen.dart';
import 'shared/block_obsirver.dart';
import 'package:todo/shared/dio_helper.dart';
import 'package:todo/layout/cubit/todo_cubit.dart';
import 'package:todo/layout/cubit/todo_states.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TodoCubit(TodoInitialState())..getUsers()..getTasks(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Todo App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: EmployeesScreen(),
      ),
    );
  }
}