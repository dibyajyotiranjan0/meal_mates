import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:syflex_meamates/screen/Signup/docment_upload.dart';

class DocumentsAll extends StatelessWidget {
  const DocumentsAll({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
            )),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.all(30),
                color: Colors.white,
                child: Icon(
                  Icons.cloud_upload_rounded,
                  color: Colors.black38,
                  size: 200,
                ),
              ),
              Text(
                "Upload Documents",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              Text(
                "We need to see your name cearly printed \n on an official documents",
                style: TextStyle(color: Colors.black45),
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Aadhar Front Papge"),
                  ),
                  Container(
                    height: 300,
                    color: Colors.grey.shade300,
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
                        color: Colors.black,
                        stackFit: StackFit.expand,
                        dashPattern: [5, 5],
                        child: SizedBox(
                          width: double.maxFinite,
                          child: TextButton.icon(
                            onPressed: null,
                            // style: ButtonStyle(
                            //     backgroundColor: MaterialStatePropertyAll(
                            //         Colors.blue.shade200)),
                            icon: Icon(Icons.file_open),
                            label: Text(
                              "Add a File",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Aadhar Back Papge"),
                  ),
                  Container(
                    height: 300,
                    color: Colors.grey.shade300,
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
                        color: Colors.black,
                        stackFit: StackFit.expand,
                        dashPattern: [5, 5],
                        child: SizedBox(
                          width: double.maxFinite,
                          child: TextButton.icon(
                            onPressed: null,
                            // style: ButtonStyle(
                            //     backgroundColor: MaterialStatePropertyAll(
                            //         Colors.blue.shade200)),
                            icon: Icon(Icons.file_open),
                            label: Text(
                              "Add a File",
                              style: TextStyle(color: Colors.blue),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ListView.builder(
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, int) {
                    return Column(
                      children: [
                        SizedBox(
                          height: 60,
                          child: ListTile(
                            textColor: Colors.black,
                            contentPadding: EdgeInsets.zero,
                            tileColor: Colors.white,
                            minLeadingWidth: 0,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (contest) => Document_Upload()));
                            },
                            dense: true,
                            title: Text(
                              "Driving License",
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15),
                            ),
                            trailing: Icon(Icons.arrow_forward_ios),
                          ),
                        ),
                        Divider(
                          color: Colors.grey.shade200,
                          thickness: 1.0,
                          indent: 0.2,
                          height: 1,
                        )
                      ],
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
