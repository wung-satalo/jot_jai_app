import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:longdo_maps_api3_flutter/longdo_maps_api3_flutter.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final map = GlobalKey<LongdoMapState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Live Map')),
      body: LongdoMapWidget(
        apiKey: "8304cf14528ce9e9333c8021924428f4",
        key: map,
        eventName: [
          IJavascriptChannel(
            name: "ready",
            onMessageReceived: (message) {
              if (kDebugMode) {
                print("Map Ready!");
              }

              /// เพิ่ม marker
              var marker = Longdo.LongdoObject(
                "Marker",
                args: [
                  {
                    "lon": 100.5018,
                    "lat": 13.7563,
                  },
                ],
              );

              map.currentState?.call(
                "Overlays.add",
                args: [marker],
              );
            },
          ),
        ],
      ),
    );
  }
}