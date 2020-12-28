import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FileItem extends StatelessWidget {
  final Reference reference;
  const FileItem({
    Key key,
    @required this.reference,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => print('Open -> ${reference.fullPath}'),
      child: Container(
        width: 100.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Icon(
                Icons.insert_drive_file,
                color: Colors.grey[400],
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
