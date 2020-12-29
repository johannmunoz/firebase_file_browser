import 'package:firebase_file_browser/src/file_item.dart';
import 'package:firebase_file_browser/src/folder_item.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class BrowserView extends StatelessWidget {
  final Reference reference;
  final String pathName;

  const BrowserView({Key key, @required this.reference, this.pathName})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pathName ?? reference.name),
      ),
      body: FutureBuilder<ListResult>(
        future: reference.listAll(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(child: Text('Error'));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasData) {
              final folders = snapshot.data.prefixes;
              final documents = snapshot.data.items;

              if (folders.isEmpty && documents.isEmpty) {
                return Center(child: Text('Folder is empty'));
              }
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      children: folders
                          .map(
                            (e) => FolderItem(reference: e),
                          )
                          .toList(),
                    ),
                    Wrap(
                      children: documents
                          .map(
                            (e) => FileItem(reference: e),
                          )
                          .toList(),
                    ),
                  ],
                ),
              );
            }
          }
          return Text('No data found');
        },
      ),
    );
  }
}
