import 'dart:async';
import 'dart:convert';
import 'dart:typed_data';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:jumpets_app/app_localizations.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'dart:ui' as ui;

import 'package:http/http.dart' as http;

import 'package:jumpets_app/ui/app_theme.dart';

class MapAddress extends StatefulWidget {
  final String address;
  MapAddress({@required this.address});

  @override
  _MapAddressState createState() => _MapAddressState();
}

class _MapAddressState extends State<MapAddress> {
  GoogleMapController _mapController;
  String _mapStyle;

  var currentLocation;
  BitmapDescriptor pinLocationIcon;

  @override
  void initState() {
    super.initState();
    _setMarker();

    rootBundle.loadString('assets/styles/map_style.txt').then((string) {
      _mapStyle = string;
    });

    _updateAddress(widget.address);
  }

  _setMarker() async {
    final Uint8List markerIcon = await getBytesFromCanvas(100);

    setState(() {
      pinLocationIcon = BitmapDescriptor.fromBytes(markerIcon);
    });
  }

  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }

  @override
  void didUpdateWidget(MapAddress oldWidget) {
    if (widget.address != oldWidget.address) {
      _updateAddress(widget.address);
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      mapToolbarEnabled: false,
      rotateGesturesEnabled: false,
      myLocationButtonEnabled: false,
      onMapCreated: _onMapCreated,
      markers: Set.from([
        Marker(
          markerId: MarkerId(widget.address),
          position: LatLng(
              currentLocation?.latitude ?? 0, currentLocation?.longitude ?? 0),
          icon: pinLocationIcon,
          infoWindow: InfoWindow(title: widget.address, snippet: '*'),
        ),
      ]),
      initialCameraPosition: CameraPosition(target: LatLng(0, 0), zoom: 10.0),
    );
  }

  void _onMapCreated(controller) {
    setState(() {
      _mapController = controller;
      _mapController.setMapStyle(_mapStyle);
    });
  }

  _updateAddress(String addr) async {
    var location = (await Geocoder.google(DotEnv().env['GOOGLE_MAPS_API_KEY'])
            .findAddressesFromQuery(addr))
        .first
        .coordinates;

    print('Map updating to:  ${location.latitude}, ${location.longitude}');
    _mapController?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
        target: LatLng(location.latitude, location.longitude), zoom: 10.0)));

    setState(() {
      currentLocation = location;
    });
  }

  Future<Uint8List> getBytesFromCanvas(int height) async {
    final ui.PictureRecorder pictureRecorder = ui.PictureRecorder();
    final Canvas canvas = Canvas(pictureRecorder);

    final Paint paintCircle = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final Paint paint = Paint()
      ..shader = LinearGradient(
        colors: [
          AppTheme.kAccentColor,
          AppTheme.kFourthColor,
        ],
      ).createShader(Rect.fromLTWH(0, 0, height.toDouble(), height.toDouble()));

    canvas.drawCircle(
        Offset(height / 2, height / 2), height.toDouble() / 3, paintCircle);

    final icon = Icons.person_pin;
    var builder = ui.ParagraphBuilder(ui.ParagraphStyle(
        fontFamily: icon.fontFamily, fontSize: height.toDouble()))
      ..pushStyle(new ui.TextStyle(foreground: paint))
      ..addText(String.fromCharCode(icon.codePoint));

    var para = builder.build();
    para.layout(ui.ParagraphConstraints(width: height.toDouble()));
    canvas.drawParagraph(para, const Offset(0, 0));

    final img = await pictureRecorder
        .endRecording()
        .toImage(para.width.floor(), height);
    final data = await img.toByteData(format: ui.ImageByteFormat.png);
    return data.buffer.asUint8List();
  }
}
