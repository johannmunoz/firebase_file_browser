library firebase_file_browser;

import 'package:firebase_file_browser/src/browser_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FileBrowser extends StatelessWidget {
  final String rootName;
  final FirebaseStorage firebaseStorage;

  const FileBrowser({
    Key key,
    @required this.firebaseStorage,
    this.rootName,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BrowserView(
      pathName: rootName,
      reference: firebaseStorage.ref(),
    );
  }
}
