import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class Document_Upload extends StatefulWidget {
  const Document_Upload({super.key});

  @override
  State<Document_Upload> createState() => _Document_UploadState();
}

class _Document_UploadState extends State<Document_Upload> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 150,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Icon(
                    Icons.drive_folder_upload,
                    size: 50,
                  ),
                ),
                Text(
                  "Upload Driving Licen",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  "Follow the instruction yu have recived in \nthe mail and upload it securely from here",
                  style: TextStyle(color: Colors.black38),
                ),
                InkWell(
                  onTap: () async {
                    FilePickerResult? result =
                        await FilePicker.platform.pickFiles();

                    if (result != null) {
                      File file = File(result.files.single.path!);
                    } else {
                      // User canceled the picker
                    }
                  },
                  child: Container(
                    height: 50,
                    width: double.maxFinite,
                    margin: EdgeInsets.only(top: 15),
                    child: DottedBorder(
                      color: Colors.black26,
                      dashPattern: [5, 5],
                      child: Center(
                        child: TextButton.icon(
                          onPressed: null,
                          icon: Icon(Icons.file_open),
                          label: Text("Add a File"),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.red),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero))),
                  onPressed: () {},
                  child: Text(
                    "Sumit For Review",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
