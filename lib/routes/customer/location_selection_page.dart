import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:latlong2/latlong.dart';
import 'package:locabite/core/utility/check_location.dart';
import 'package:locabite/routes.dart';

class LocationSelectionPage extends StatefulWidget {
  const LocationSelectionPage({super.key});

  @override
  State<LocationSelectionPage> createState() => _LocationSelectionPageState();
}

class _LocationSelectionPageState extends State<LocationSelectionPage> {
  final MapController _mapController = MapController();

  LatLng? _currentPosition;
  String _selectedAddress = "Select your delivery location";
  double _currentZoom = 20;

  @override
  void initState() {
    super.initState();
    loadLocation();
  }

  void loadLocation() async {
    LatLng pos = await getCurrentLocation();
    setState(() => _currentPosition = pos);

    _mapController.move(pos, 16); // zoom
    await _updateSelectedLocation(pos);
  }

  // Map Styles
  final List<MapStyle> _mapStyles = [
    MapStyle('OpenStreetMap', 'https://tile.openstreetmap.org/{z}/{x}/{y}.png'),
    MapStyle('OpenTopoMap', 'https://tile.opentopomap.org/{z}/{x}/{y}.png'),
    MapStyle(
      'CartoDB Light',
      'https://cartodb-basemaps.a.ssl.fastly.net/light_all/{z}/{x}/{y}.png',
    ),
  ];

  int _currentStyleIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FlutterMap(
            mapController: _mapController,
            options: MapOptions(
              initialCenter: LatLng(0, 0),
              initialZoom: _currentZoom,
              onTap: (tapPosition, latlng) => _updateSelectedLocation(latlng),
              onPositionChanged: (position, hasGesture) {
                if (hasGesture && position.zoom != null) {
                  setState(() {
                    _currentZoom = position.zoom!;
                  });
                }
              },
            ),
            children: [
              TileLayer(
                urlTemplate: _mapStyles[_currentStyleIndex].url,
                userAgentPackageName: 'com.localbite.app',
              ),
              if (_currentPosition != null)
                MarkerLayer(
                  markers: [
                    Marker(
                      point: _currentPosition!,
                      child: Icon(
                        Icons.location_pin,
                        color: Colors.red,
                        size: 50,
                      ),
                    ),
                  ],
                ),
              if (_currentPosition != null)
                CircleLayer(
                  circles: [
                    CircleMarker(
                      point: _currentPosition!,
                      color: Colors.blue.withOpacity(0.3),
                      borderColor: Colors.blue,
                      borderStrokeWidth: 2,
                      radius: 1000,
                    ),
                  ],
                ),
            ],
          ),

          _buildBackButton(),
          // _buildStyleSelector(),
          _buildZoomControls(),
          _buildAddressCard(),
        ],
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      top: 50,
      left: 20,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
        ),
        child: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }

  // Widget _buildStyleSelector() {
  //   return Positioned(
  //     top: 50,
  //     right: 20,
  //     child: Container(
  //       decoration: BoxDecoration(
  //         color: Colors.white,
  //         borderRadius: BorderRadius.circular(25),
  //         boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
  //       ),
  //       child: PopupMenuButton<int>(
  //         icon: const Icon(Icons.layers),
  //         onSelected: (index) {
  //           setState(() {
  //             _currentStyleIndex = index;
  //           });
  //         },
  //         itemBuilder: (context) {
  //           return _mapStyles
  //               .asMap()
  //               .entries
  //               .map(
  //                 (entry) => PopupMenuItem(
  //                   value: entry.key,
  //                   child: Text(entry.value.name),
  //                 ),
  //               )
  //               .toList();
  //         },
  //       ),
  //     ),
  // //   );
  // }

  Widget _buildZoomControls() {
    return Positioned(
      bottom: 200,
      right: 20,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 8)],
        ),
        child: Column(
          children: [
            IconButton(icon: const Icon(Icons.add), onPressed: _zoomIn),
            IconButton(icon: const Icon(Icons.remove), onPressed: _zoomOut),
          ],
        ),
      ),
    );
  }

  Widget _buildAddressCard() {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 16)],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.location_on, color: Colors.red),
                SizedBox(width: 8),
                Text(
                  'Delivery Address',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey),
              ),
              child: Column(
                children: [
                  Text(
                    _selectedAddress,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    '📍 Tap map to select • Drag to move pin • Use buttons to zoom',
                    style: TextStyle(fontSize: 11, color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _proceedToPayment,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.payment),
                    SizedBox(width: 8),
                    Text(
                      'Proceed to Payment',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _updateSelectedLocation(LatLng newLocation) async {
    setState(() {
      _currentPosition = newLocation;
      _selectedAddress = "Fetching address...";
    });

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        newLocation.latitude,
        newLocation.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        // Build address dynamically, skipping null/empty fields
        final addressParts =
            [
              place.street,
              place.locality,
              place.administrativeArea,
              place.country,
            ].where((e) => e != null && e.isNotEmpty).toList();

        setState(() {
          _selectedAddress = addressParts.join(', ');
        });
      } else {
        setState(() {
          _selectedAddress =
              "${newLocation.latitude}, ${newLocation.longitude}";
        });
      }
    } catch (e) {
      setState(() {
        _selectedAddress = "${newLocation.latitude}, ${newLocation.longitude}";
      });
    }

    _mapController.move(newLocation, _currentZoom);
  }

  void _zoomIn() {
    setState(() {
      _currentZoom++;
      _mapController.move(_currentPosition!, _currentZoom);
    });
  }

  void _zoomOut() {
    setState(() {
      _currentZoom--;
      _mapController.move(_currentPosition!, _currentZoom);
    });
  }

  void _proceedToPayment() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Delivery to: $_selectedAddress'),
        backgroundColor: Colors.green,
      ),
    );
    Get.toNamed(AppRoute.paymentMethodPage);
  }
}

class MapStyle {
  final String name;
  final String url;

  MapStyle(this.name, this.url);
}
