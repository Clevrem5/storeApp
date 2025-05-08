import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';
import 'package:store_app/Core/utils/app_colors.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';

import '../../Common_Widgets/store_icons.dart';

class NewAddressDetail extends StatefulWidget {
  const NewAddressDetail({super.key});

  @override
  State<NewAddressDetail> createState() => _NewAddressDetailState();
}

class _NewAddressDetailState extends State<NewAddressDetail> {
  final MapController mapController = MapController();
  final TextEditingController viloyatController = TextEditingController();
  final TextEditingController tumanController = TextEditingController();
  final TextEditingController mahallaController = TextEditingController();

  LatLng _center = const LatLng(41.2995, 69.2401);
  List<Marker> _markers = [];
  bool _showBottomSheet = true;

  Future<LatLng?> searchLocation(String query) async {
    final url = Uri.parse('https://nominatim.openstreetmap.org/search?q=$query&format=json&limit=1');
    final response = await http.get(url, headers: {'User-Agent': 'flutter_map_example_app'});

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      if (data.isNotEmpty) {
        final lat = double.parse(data[0]['lat']);
        final lon = double.parse(data[0]['lon']);
        return LatLng(lat, lon);
      }
    }
    return null;
  }

  void _goToMyLocation() async {
    final permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied || permission == LocationPermission.deniedForever) {
      return;
    }

    final position = await Geolocator.getCurrentPosition();
    final LatLng myLocation = LatLng(position.latitude, position.longitude);

    setState(() {
      _center = myLocation;
      _markers = [
        Marker(
          point: myLocation,
          width: 60,
          height: 60,
          child: const Icon(Icons.my_location, color: Colors.blue, size: 40),
        )
      ];
    });

    mapController.move(myLocation, 15);
  }

  void _searchAndNavigate() async {
    final query = '${viloyatController.text}, ${tumanController.text}, ${mahallaController.text}';
    final location = await searchLocation(query);
    if (location != null) {
      setState(() {
        _center = location;
        _markers = [
          Marker(
            point: location,
            width: 60,
            height: 60,
            child: SvgPicture.asset(
              "assets/icons/map_pin.svg",
              color: AppColors.black,
            ),
          ),
        ];
      });
      mapController.move(location, 15.0);
    }
  }

  void _handleTap(TapPosition tapPosition, LatLng latLng) {
    setState(() {
      _center = latLng;
      _markers = [
        Marker(
          point: latLng,
          width: 64,
          height: 64,
          child: SvgPicture.asset(
            "assets/icons/pin.svg",
            color: AppColors.black,
          ),
        ),
      ];
      _showBottomSheet = true;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: StoreAppBar(
        title: "NewAddress",
      ),
      body: Stack(
        children: [
          FlutterMap(
            mapController: mapController,
            options: MapOptions(
              initialCenter: _center,
              initialZoom: 13,
              onTap: _handleTap,
            ),
            children: [
              TileLayer(
                urlTemplate: "https://{s}.basemaps.cartocdn.com/light_all/{z}/{x}/{y}{r}.png",
                subdomains: ['a', 'b', 'c'],
                tileProvider: NetworkTileProvider(),
                userAgentPackageName: 'com.example.store_app',
              ),
              MarkerLayer(markers: _markers),
            ],
          ),
          Positioned(
            top: 40,
            right: 10,
            child: Column(
              children: [
                FloatingActionButton(
                  mini: true,
                  onPressed: () => mapController.move(_center, mapController.camera.zoom + 1),
                  child: const Icon(Icons.add),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  mini: true,
                  onPressed: () => mapController.move(_center, mapController.camera.zoom - 1),
                  child: const Icon(Icons.remove),
                ),
                SizedBox(height: 10),
                FloatingActionButton(
                  mini: true,
                  onPressed: _goToMyLocation,
                  child: const Icon(Icons.my_location),
                ),
              ],
            ),
          ),
          if (_showBottomSheet)
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: SizedBox(
                height: 403.h,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  // padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                    boxShadow: [BoxShadow(blurRadius: 10, color: Colors.black26)],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, right: 25, left: 25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: StoreText(
                                text: "Address",
                                color: AppColors.black,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            StoreIcons(
                              icons: "assets/icons/cancel.svg",
                              color: AppColors.black,
                              callback: () {
                                setState(() {
                                  _showBottomSheet = false;
                                });
                              },
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Divider(
                          color: AppColors.buttonBorder,
                          height: 1.5,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        StoreText(
                          text: "Address Nickname",
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        SizedBox(
                          height: 52.h,
                          child: TextField(
                            controller: viloyatController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                                hintText: "Choose one",
                                hintStyle: TextStyle(
                                  color: AppColors.hintText,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        StoreText(
                          text: "Full Address",
                          color: AppColors.black,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        SizedBox(
                          height: 4.h,
                        ),
                        SizedBox(
                          height: 52.h,
                          child: TextField(
                            controller: tumanController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10), borderSide: BorderSide(color: AppColors.hintText, width: 1.5)),
                                hintText: "Enter your full address...",
                                hintStyle: TextStyle(
                                  color: AppColors.hintText,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                )),
                          ),
                        ),
                        // TextField(
                        //   controller: mahallaController,
                        //   decoration: const InputDecoration(labelText: "Mahalla"),
                        // ),
                        SizedBox(height: 80.h),
                        SizedBox(
                          width: double.infinity.w,
                          height: 54.h,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.black,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                            onPressed: _searchAndNavigate,
                            child: StoreText(
                              text: "Qidirish",
                              color: AppColors.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
