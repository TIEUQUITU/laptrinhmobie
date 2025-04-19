import 'package:app_01/My_widgets_01/MyButton.dart';
import 'package:app_01/My_widgets_01/MyContainer.dart';
import 'package:app_01/My_widgets_01/MyTextField2.dart';
import 'package:flutter/material.dart';
import 'My_widgets_01/MyScaffold.dart';
import 'My_widgets_01/MyAppbar.dart';
import 'My_widgets_01/MyText.dart';
import 'My_widgets_01/MyTextField.dart';
import 'My_widgets_01/MyTextField2.dart';
import 'My_widgets_01/BoxListTile.dart';
import 'My_widgets_02_from/f8_form_ImagePicker.dart';
import 'package:app_01/userMs/view/UserForm.dart';
import 'package:app_01/notesApp/view/NoteForm.dart';
import 'package:app_01/notesApp/view/NoteListScreen.dart';
import 'package:app_01/userMs_API/view/UserListScreen.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: UserListScreen(),
    );
  }
}