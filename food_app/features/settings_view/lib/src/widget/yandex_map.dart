import 'dart:math' as math;
import 'package:core/core.dart' as core;
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

import '../listeners/map_object_listener.dart';

class SinglePlacemarkMap extends StatefulWidget {
  const SinglePlacemarkMap({super.key});

  @override
  State<SinglePlacemarkMap> createState() => _SinglePlacemarkMapState();
}

class _SinglePlacemarkMapState extends State<SinglePlacemarkMap> {
  late core.MapObjectCollection _mapObjectCollection;
  core.MapWindow? _mapWindow;

  static const _markerPoint =
  core.Point(latitude: 53.891247, longitude: 27.567123);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: core.YandexMap(onMapCreated: _onMapCreated),
    );
  }

  void _onMapCreated(core.MapWindow mapWindow) {
    _mapWindow = mapWindow;

    mapWindow.map.move(
      const core.CameraPosition(
        _markerPoint,
        zoom: 15,
        azimuth: 0,
        tilt: 30.0,
      ),
    );
    _mapObjectCollection = mapWindow.map.mapObjects.addCollection();
    _mapObjectCollection.addPlacemark()
      ..geometry = _markerPoint
      ..setIcon(
        core.ImageProvider.fromImageProvider(
          const AssetImage("assets/placemark_icon.png"),
        ),
      )
      ..setIconStyle(
        const core.IconStyle(
          anchor: math.Point(0.5, 1.0),
          scale: 0.2,
        ),
      )..addTapListener(_placemarkTapListener);
  }

  late final _placemarkTapListener = MapObjectTapListenerImpl(
    onMapObjectTapped: (mapObject, _) {
      showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomText(
                text: "101 Rest Bistro",
                fontWeight: FontWeight.w900,
              ),
              const SizedBox(height: 8),
              const CustomText(
                  text: "Address: Vulica Kastryčnickaja 10/2, Minsk, Belarus",
                  fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 8),
              const CustomText(
                  text: "Contact: +375 17 123-4567",
                  fontWeight: FontWeight.w700,
              ),
              const SizedBox(height: 8),
              const CustomText(
                  text: "Hours:\nMon-Fri: 11:00 AM – 11:00 PM\nSat-Sun: 10:00 AM – 12:00 AM",
                  fontWeight: FontWeight.w700,
                  maxLines: 3,
              ),
              const SizedBox(height: 16),
              const CustomText(
                  text: "Description: A modern European bistro blending rustic charm "
                  "with contemporary flair. Renowned for artisanal bruschetta, hearty "
                  "borscht, and premium mains like Gorgonzola Filet Mignon. "
                  "Perfect for romantic dinners or lively gatherings.",
                  fontWeight: FontWeight.w500,
                  maxLines: 5,
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                child: const CustomText(
                  text: 'Close',
                  fontWeight: FontWeight.w700,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ],
          ),
        ),
      );
      return true;
    },
  );
}

