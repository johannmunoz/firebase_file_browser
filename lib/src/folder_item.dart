import 'package:firebase_file_browser/src/browser_view.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FolderItem extends StatelessWidget {
  final Reference reference;
  final double appBarElevation;
  final Color appBarColor;
  final TextStyle appBarTextStyle;
  const FolderItem({
    Key key,
    @required this.reference,
    this.appBarElevation,
    this.appBarColor,
    this.appBarTextStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => BrowserView(
              reference: reference,
              appBarColor: appBarColor,
              appBarElevation: appBarElevation,
              appBarTextStyle: appBarTextStyle,
            ),
          ),
        );
      },
      child: Container(
        width: 100.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                Icons.folder,
                color: Colors.blue[300],
                size: 50.0,
              ),
              Text(
                reference.name,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
