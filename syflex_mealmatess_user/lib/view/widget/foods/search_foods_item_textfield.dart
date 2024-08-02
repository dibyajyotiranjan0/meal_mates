import 'package:flutter/material.dart';

class SearchFood_Textfield extends StatefulWidget {
  const SearchFood_Textfield({super.key});

  @override
  State<SearchFood_Textfield> createState() => _SearchFood_TextfieldState();
}

class _SearchFood_TextfieldState extends State<SearchFood_Textfield> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        style: TextStyle(color: Colors.black, fontSize: 15),
        decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide.none),
            // focusedBorder: InputBorder.none,
            // enabledBorder: InputBorder.none,
            fillColor: Colors.grey.shade300,
            filled: true,
            hintText: "Search items in this Resturants",
            suffixIcon: Icon(
              Icons.search,
              color: Colors.black,
              size: 25,
            )),
      ),
    );
  }
}
