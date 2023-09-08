import 'package:flutter/material.dart';

import 'layout/cubit/todo_cubit.dart';

GlobalKey key = GlobalKey();
Widget buildTaskCard ()=>  Card(

  child: Column(

    crossAxisAlignment: CrossAxisAlignment.start,

    children: [

      Text(

        "Title Title Title",

        style: TextStyle(

          fontSize: 25,

          fontWeight: FontWeight.bold,

        ),

      ),

      Padding(

        padding: const EdgeInsets.only(

          right: 25,

          top: 10,

          bottom: 10,

        ),

        child: Container(

          height: 1,

          color: Colors.grey,

        ),

      ),

      Text(

        "body body body body body body body body body body body body body body body body body body",

        style: TextStyle(

          fontSize: 18,

          fontWeight: FontWeight.normal,

        ),

      ),

    ],

  ),

);


