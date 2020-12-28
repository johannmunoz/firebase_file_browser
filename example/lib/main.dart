import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_file_browser/firebase_file_browser.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final FirebaseStorage _storage =
      FirebaseStorage.instanceFor(app: Firebase.app());
  @override
  Widget build(BuildContext context) {
    return FileBrowser(
      rootName: 'File Browser',
      firebaseStorage: _storage,
    );
  }
}
