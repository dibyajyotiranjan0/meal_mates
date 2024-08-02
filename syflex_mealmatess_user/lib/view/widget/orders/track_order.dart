import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class TrackOrder extends StatefulWidget {
  const TrackOrder({super.key});

  @override
  State<TrackOrder> createState() => _TrackOrderState();
}

class _TrackOrderState extends State<TrackOrder> {
  @override
  Widget build(BuildContext context) {
    final Map<String, Marker> _markers = {};

    Future<void> _onMapCreated(GoogleMapController controller) async {
      _markers.clear();
      print("Markar is clear");
      setState(() {
        final marker = Marker(
          // icon: pinLocationIcon!,
          markerId: MarkerId("mumbai_03"),
          position: LatLng(19.076090, 72.877426), //lat,lon
          infoWindow: InfoWindow(
              title: "Mumbai City India",
              snippet: "Mumbai City",
              onTap: () {
                // print("${widget.cityData['lat']}, ${72.877426.tostring()}");
              }),
          onTap: () {
            print("Clicked on marker");
          },
        );
        // print("${widget.cityData['lat']}, ${widget.cityData['lng']}");
        _markers["Mumbai City India"] = marker;
      });
    }

    launchMap(lat, long) {
      MapsLauncher.launchCoordinates(lat, long);
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Padding(
            padding: const EdgeInsets.only(left: 20),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
        ),
        title: Text(
          "Track Order",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 600,
              child: GoogleMap(
                onMapCreated: _onMapCreated,
                initialCameraPosition: CameraPosition(
                  target: LatLng(19.076090, 72.877426),
                  zoom: 7,
                ),
                markers: _markers.values.toSet(),
              ),
              // child: Image.asset(
              //   "assets/icon/google_icon.png",
              //   fit: BoxFit.fill,
              // ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20, right: 20),
              child: SizedBox(
                child: TextField(
                  autocorrect: true,
                  decoration: InputDecoration(
                      hintText: "Time Squree NYC, surat",
                      suffixIcon: Icon(
                        Icons.location_on_outlined,
                        color: Colors.grey,
                      ),
                      border: OutlineInputBorder(
                          borderSide: BorderSide.none,
                          borderRadius: BorderRadius.circular(10)),
                      fillColor: Colors.grey.shade200,
                      filled: true),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, bottom: 30),
              child: SizedBox(
                //height: 400,
                // width: 400,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  //fit: StackFit.loose,
                  children: [
                    ListTile(
                      textColor: Colors.black,
                      isThreeLine: true,
                      leading: Icon(
                        Icons.location_on,
                        color: Colors.redAccent,
                        size: 50,
                      ),
                      title: FittedBox(
                          fit: BoxFit.none, child: Text("Order Placed")),
                      subtitle: FittedBox(
                          fit: BoxFit.none,
                          child: Text('September 05:08.09 AM')),
                      trailing: TextButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.schedule,
                            color: Colors.redAccent,
                          ),
                          label: Text("On Time")),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: SizedBox(
                        height: 50,
                        width: 2,
                        child: VerticalDivider(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    ListTile(
                      textColor: Colors.black,
                      // titleAlignment: ListTileTitleAlignment.threeLine,
                      leading: Icon(
                        Icons.location_on,
                        size: 50,
                        color: Colors.redAccent,
                      ),
                      title: Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                            fit: BoxFit.none, child: Text("Order Confirmed")),
                      ),
                      subtitle: Align(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                            fit: BoxFit.none,
                            child: Text('September 05:08.09 AM')),
                      ),
                      // trailing: TextButton.icon(
                      //     onPressed: () {},
                      //     icon: Icon(Icons.schedule),
                      //     label: Text("On Time")),
                    ),
                    // Positioned(
                    //   left: 10,
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: SizedBox(
                        height: 50,
                        width: 2,
                        child: VerticalDivider(
                          color: Colors.redAccent,
                        ),
                      ),
                    ),
                    // ),
                    ListTile(
                      textColor: Colors.black,
                      leading: Icon(
                        Icons.location_on,
                        size: 50,
                        color: Colors.redAccent,
                      ),
                      title: Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                            fit: BoxFit.none, child: Text("Order Delivery")),
                      ),
                      subtitle: Align(
                        alignment: Alignment.topLeft,
                        child: FittedBox(
                            fit: BoxFit.none,
                            child: Text('September 05:08.09 AM')),
                      ),
                      // trailing: TextButton.icon(onPressed: (){}, icon: Icon(Icons.schedule), label: Text("On Time")),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
