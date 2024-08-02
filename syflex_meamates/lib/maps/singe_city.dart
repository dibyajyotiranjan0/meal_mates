import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:maps_launcher/maps_launcher.dart';

class SingleCity extends StatefulWidget {
  // final Map cityData;
  // const SingleCity({Key? key, required this.cityData}) : super(key: key);

  @override
  State<SingleCity> createState() => _SingleCityState();
}

class _SingleCityState extends State<SingleCity> {
  // BitmapDescriptor? pinLocationIcon;

  // void setCustomMapPin() async {
  //   pinLocationIcon = await BitmapDescriptor.fromAssetImage(
  //     const ImageConfiguration(devicePixelRatio: 2.5),
  //     'assets/images/markericon.png',
  //   );
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // setCustomMapPin();
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('About Mumbai City India')),
      body: Column(
        children: [
          // Card(
          //   elevation: 5,
          //   child: Column(
          //     children: [
          //       Image.network(
          //         widget.cityData['image'],
          //         height: 200,
          //         fit: BoxFit.cover,
          //         width: MediaQuery.of(context).size.width,
          //       ),
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10),
          //             child: Text(
          //               widget.cityData['name'],
          //               style: const TextStyle(
          //                 fontSize: 18,
          //                 fontWeight: FontWeight.bold,
          //               ),
          //             ),
          //           ),
          //           ElevatedButton(
          //             onPressed: () {
          //               launchMap(
          //                   widget.cityData['lat'], widget.cityData['lng']);
          //             },
          //             child: const Text("Direction"),
          //           )
          //         ],
          //       ),
          //     ],
          //   ),
          // ),

          Expanded(
            // child: Container(
            //   color: Colors.red,
            // ),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: LatLng(19.076090, 72.877426),
                zoom: 7,
              ),
              markers: _markers.values.toSet(),
            ),
          )
        ],
      ),
    );
  }
}
