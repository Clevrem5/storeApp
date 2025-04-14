import 'dart:convert';

import 'package:flutter/material.dart';
// import 'package:flutter_map/flutter_map.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:store_app/Core/utils/app_colors.dart';
// import 'package:store_app/Features/Common_Widgets/store_app_bar.dart';

// import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart'; // latlong2 paketiga e'tibor bering
import 'package:http/http.dart' as http;

class NewAddressDetail extends StatefulWidget {
  const NewAddressDetail({super.key});

  @override
  State<NewAddressDetail> createState() => _NewAddressDetailState();
}

class _NewAddressDetailState extends State<NewAddressDetail> {
  final TextEditingController _searchController = TextEditingController();
  final MapController mapController = MapController();
  List<Marker> _markers = [];
  LatLng _center = const LatLng(41.2995, 69.2401); // Default Toshkent markazi

  // Qidiruvni amalga oshirish
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

  // Qidiruv va xaritani yangilash
  void _searchAndNavigate() async {
    final query = _searchController.text;
    final location = await searchLocation(query);
    if (location != null) {
      setState(() {
        _center = location; // Markerni va xaritani yangi joyga ko'chirish
        _markers = [
          Marker(
            point: location,
            width: 60,
            height: 60,
            child: const Icon(Icons.location_on, color: Colors.red, size: 40),
          ),
        ];
      });
      mapController.move(location, 15.0); // Xarita markazini yangilash
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New Address"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _searchController,
                    decoration: const InputDecoration(
                      hintText: 'Manzilni kiriting...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.search),
                  onPressed: _searchAndNavigate,
                ),
              ],
            ),
          ),
          Expanded(
            child: FlutterMap(
              mapController: mapController,
              options: MapOptions(
                initialCenter: _center, // Xarita markazini o'rnatish
                initialZoom: 13.0,
              ),
              children: [
                TileLayer(
                  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  subdomains: ['a', 'b', 'c'],
                ),
                MarkerLayer(markers: _markers),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

