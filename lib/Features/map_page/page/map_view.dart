import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import 'package:store_app/Features/map_page/bloc/new_address_bloc.dart';
import 'package:store_app/Features/map_page/bloc/new_address_event.dart';
import 'package:store_app/Features/map_page/bloc/new_address_state.dart';

class NewAddressPage extends StatelessWidget {
  const NewAddressPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: StoreAppBar(
        title: "New Address",
        callback: () => context.pop(),
      ),
      body: BlocConsumer<NewAddressBloc, NewAddressState>(
        listener: (context, state) {
          if (state.status == NewAddressStatus.selected) {
            showModalBottomSheet(
              barrierColor: Colors.transparent,
              isDismissible: true,
              context: context,
              builder: (context) => Container(height: 200,child: Text("Address: ${state.address}"),),
            );
          }
        },
        builder: (context, state) {
          return Column(
            children: [
              Expanded(
                child: FlutterMap(
                  mapController: context.read<NewAddressBloc>().controller,
                  options: MapOptions(
                    initialCenter: LatLng(41.285799883900715, 69.20363493014382),
                    onTap: (tapPosition, point) {
                      context.read<NewAddressBloc>().add(
                            NewAddressChooseLocation(chosenLocation: point),
                          );
                    },
                  ),
                  children: [
                    TileLayer(
                      urlTemplate: "https://tile.openstreetmap.org/{z}/{x}/{y}.png",
                      subdomains: ['a', 'b', 'c'],
                      userAgentPackageName: 'com.example.app',
                    ),
                    MarkerLayer(markers: state.markers),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Text("Address: ${state.address}"),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<NewAddressBloc>().add(GoToCurrentLocation());
        },
        tooltip: "Go My Locations",
        child: Icon(Icons.my_location),
      ),
    );
  }
}
