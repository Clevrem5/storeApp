import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:latlong2/latlong.dart';
import 'package:store_app/Features/Common_Widgets/storeAppBar.dart';
import 'package:store_app/Features/Common_Widgets/store_tex.dart';
import 'package:store_app/Features/map_page/bloc/new_address_bloc.dart';
import 'package:store_app/Features/map_page/bloc/new_address_event.dart';
import 'package:store_app/Features/map_page/bloc/new_address_state.dart';
import 'package:store_app/Features/newCard/store_app_dialog.dart';

class NewAddressPage extends StatefulWidget {
  const NewAddressPage({super.key});

  @override
  State<NewAddressPage> createState() => _NewAddressPageState();
}

class _NewAddressPageState extends State<NewAddressPage> {
  bool select = false;

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
              isDismissible: false,
              context: context,
              builder: (context) {
                String? selectedValue;

                return StatefulBuilder(
                  builder: (context, setState) => Container(
                    width: 390.w,
                    height: 403.h,
                    padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 15.h),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(
                        bottom: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // Title Row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StoreText(
                              text: "Address",
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                            ),
                            IconButton(
                              onPressed: () {
                                context.pop();
                              },
                              icon: Icon(Icons.clear, size: 30),
                            ),
                          ],
                        ),
                        // SizedBox(height: 15.h),
                        Divider(color: Colors.black12),
                        // SizedBox(height: 20.h),
                        // Dropdown Section
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            StoreText(
                              text: "Address Nickname",
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            SizedBox(height: 6.h),
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 12.w),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                border: Border.all(color: Colors.black12, width: 0.7),
                              ),
                              child: DropdownButton<String>(
                                isExpanded: true,
                                underline: SizedBox(),
                                hint: Text("Choose one"),
                                value: selectedValue,
                                items: ['Home', 'Work', 'Other'].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    selectedValue = newValue;
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: 16.h),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          spacing: 10.h,
                          children: [
                            StoreText(
                              text: "Full Address",
                              color: Colors.black,
                              // fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                // hint: Text("${state.address}"),
                                hintMaxLines: 1,hintText: state.address,
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // SizedBox(height: 10.h),
                        Row(
                          spacing: 10,
                          children: [
                            Checkbox(
                              value: select,
                              onChanged: (value) {
                                setState(() {
                                  select = !select;
                                });
                              },
                              activeColor: Colors.black,
                              shape: RoundedRectangleBorder(),
                              checkColor: Colors.white,
                            ),
                            StoreText(
                              text: "Make this as a default address",
                              color: Colors.black,
                              fontSize: 14.sp,
                            ),
                          ],
                        ),
                        // SizedBox(height: 9.3.h),
                        ElevatedButton(
                          onPressed: ()  {
                            Material(
                              surfaceTintColor: Colors.transparent,
                              child: StoreAppDialog(
                                title: "Congratulations",
                                subtitle: "You did it finally!",
                                callback: () {
                                  context.pop();
                                  setState((){});
                                },
                              ),
                            );
                            setState((){});
                          },
                          style: ElevatedButton.styleFrom(
                            minimumSize: Size(341.w, 54.h),
                            elevation: 5,
                            backgroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadiusGeometry.circular(10),
                            ),
                          ),
                          child: StoreText(
                            text: "Add",
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
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
