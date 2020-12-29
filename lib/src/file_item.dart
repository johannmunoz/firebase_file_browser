import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:open_file/open_file.dart';

class FileItem extends StatelessWidget {
  final Reference reference;
  const FileItem({
    Key key,
    @required this.reference,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<File>(
      future: getFileFromUrl(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Container();
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            width: 100.0,
            height: 100.0,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: CircularProgressIndicator(),
            ),
          );
        }

        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            return GestureDetector(
              onTap: () async {
                final file = snapshot.data;
                await OpenFile.open(file.path);
              },
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
        return Container();
      },
    );
  }

  Future<File> getFileFromUrl() async {
    final url = await reference.getDownloadURL();
    return await DefaultCacheManager().getSingleFile(url);
  }
}
