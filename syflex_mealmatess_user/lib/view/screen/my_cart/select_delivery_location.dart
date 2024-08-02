import 'package:flutter/material.dart';

class SelectDeliveryLocation extends StatefulWidget {
  const SelectDeliveryLocation({super.key});

  @override
  State<SelectDeliveryLocation> createState() => _SelectDeliveryLocationState();
}

class _SelectDeliveryLocationState extends State<SelectDeliveryLocation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            )),
        title: Text(
          "Select your delivery location",
          style: TextStyle(fontSize: 16, color: Colors.black),
        ),
        actions: [
          Icon(
            Icons.notifications,
            color: Colors.red,
          ),
          SizedBox(
            width: 50,
          )
        ],
      ),
      body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
        return SingleChildScrollView(
          controller: ScrollController(),
          //physics: NeverScrollableScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                  height: viewportConstraints.maxHeight * 0.5,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.circular(20)),
                        height: viewportConstraints.maxHeight * 0.38,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                height: 50,
                                child: TextField(
                                  autocorrect: true,
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 20),
                                  decoration: InputDecoration(
                                      // fillColor: Colors.green,
                                      //filled: true,
                                      border: InputBorder.none,
                                      prefixIcon: Icon(
                                        Icons.search,
                                        color: Colors.pinkAccent,
                                      )),
                                )),
                            Positioned(
                              top: 60,
                              // height: 300,
                              // width: 400, //double.infinity,
                              child: SizedBox(
                                height: viewportConstraints.maxHeight * 1,
                                width: viewportConstraints.maxWidth * 1,
                                child: ListView.builder(
                                    itemCount: 50,
                                    shrinkWrap: true,
                                    physics: ScrollPhysics(),
                                    //scrollDirection: Axis.vertical,
                                    itemBuilder: (context, index) {
                                      return SizedBox(
                                        height: 50,
                                        child: Padding(
                                            padding: EdgeInsets.only(left: 50),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 8.0),
                                                  child: Text(
                                                      "Bhubaneswar, Odisha India"),
                                                ),
                                                Divider(
                                                  color: Colors.black26,
                                                )
                                              ],
                                            )),
                                      );
                                    }),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                          height: 50,
                          width: MediaQuery.of(context).size.width * .9,
                          child: TextButton.icon(
                              style: ButtonStyle(
                                  alignment: Alignment.center,
                                  backgroundColor: MaterialStateProperty.all(
                                      Colors.redAccent),
                                  shape: MaterialStateProperty.all(
                                      RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(15)))),
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            SelectDeliveryLocation()));
                              },
                              icon: Icon(
                                Icons.location_on_outlined,
                                size: 20,
                                color: Colors.white,
                              ),
                              label: Text("USE CURRENT LOCATION",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 18)))),
                      SizedBox(
                        height: 10,
                      )
                    ],
                  )),
              Container(
                height: viewportConstraints.maxHeight * 0.5,
                width: viewportConstraints.maxWidth * 1,
                color: Colors.white,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("Saved Address"),
                    ),
                    Material(
                      color: Colors.white,
                    )
                  ],
                ),
              )
            ],
          ),
        );
      }),
    );
  }
}
