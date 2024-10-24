import 'dart:math';

import 'package:JanSahayak/jan_sahayak.dart';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'dart:convert';

import '../../utils/crypto_decrypt_utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);


  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double zoomLevel=5e4;

  final map = ArcGISMap.withBasemapStyle(BasemapStyle.arcGISTopographic);
  final _graphicsOverlay = GraphicsOverlay();
  final _worldLocatorTask = LocatorTask.withUri(
    Uri.parse(
      'https://geocode-api.arcgis.com/arcgis/rest/services/World/GeocodeServer',
    ),
  );
  // Create a controller for the map view.
  final _mapViewController = ArcGISMapView.createController();
  var _initialViewpoint ;
  // A flag for when the map view is ready and controls can be used.
  var _ready = false;
  BuildContext? mContext;
  final SplashController controller = Get.put(SplashController());


  @override
  void initState() {
    super.initState();
    controller.navigatePage();
  }


  @override
  Widget build(BuildContext context) {
    mContext=context;
    _initialViewpoint = Viewpoint.fromCenter(
      ArcGISPoint(
        x: 76.787,
        y: 30.740,
        spatialReference: SpatialReference.wgs84,
      ),
      scale: zoomLevel,
    );
    return Scaffold(
      body:Stack(
        children: [
          Container(
            width: double.infinity,
            child: Image.asset(
              width: double.infinity,
              height: double.infinity,
              AssetRes.splash_background,
            ),
          ),
          // Centered logo
        ],
      ),
    );


  }

  Widget getmap(){
    return ArcGISMapView(
      controllerProvider: () => _mapViewController,
      onMapViewReady: onMapViewReady,
      onTap: onTap,
    );
  }

  void onMapViewReady() async {
    // Create a map with the topographic basemap style and set to the map view.


    _mapViewController.arcGISMap = map;

    // Zoom to a specific extent.
    _mapViewController.setViewpoint(_initialViewpoint);

    // Create a picture marker symbol using an image asset.
    final image = await ArcGISImage.fromAsset(AssetRes.chirayu_map);
    final pictureMarkerSymbol = PictureMarkerSymbol.withImage(image)
      ..width = 35
      ..height = 35;
    pictureMarkerSymbol.offsetY = pictureMarkerSymbol.height / 2;

    // Create a renderer using the picture marker symbol and set to the graphics overlay.
    _graphicsOverlay.renderer = SimpleRenderer(symbol: pictureMarkerSymbol);
    // Add the graphics overlay to the map view.
    _mapViewController.graphicsOverlays.add(_graphicsOverlay);

    final mapImageLayer = ArcGISMapImageLayer.withUri(
      Uri.parse(
        'https://webgis1.nic.in/publishing/rest/services/haryana/haryana2/MapServer/',
      ),
    );
    map.operationalLayers.add(mapImageLayer);
    // Load the map image layer.


    await _worldLocatorTask.load();
    await mapImageLayer.load();


    setState(() => _ready = true);
    setState(() {
      convertZoomLevel(17);
    });
  }


  void onTap(Offset localPosition) async {
    // Remove already existing graphics.
    if (_graphicsOverlay.graphics.isNotEmpty) _graphicsOverlay.graphics.clear();

    // Convert the screen point to a map point.
    final mapTapPoint =
    _mapViewController.screenToLocation(screen: localPosition);
    if (mapTapPoint == null) return;

    // Normalize the point incase the tapped location crosses the international date line.
    final normalizedTapPoint =
    GeometryEngine.normalizeCentralMeridian(geometry: mapTapPoint);
    if (normalizedTapPoint == null) return;





    // Create a graphic object for the tapped point.
    _graphicsOverlay.graphics.add(Graphic(geometry: normalizedTapPoint));

    // Initialize reverse geocode parameters.
    final reverseGeocodeParameters = ReverseGeocodeParameters()..maxResults = 1;

    // Perform a reverse geocode using the tapped location and parameters.
    final reverseGeocodeResult = await _worldLocatorTask.reverseGeocode(
      location: normalizedTapPoint as ArcGISPoint,
      parameters: reverseGeocodeParameters,
    );
    if (reverseGeocodeResult.isEmpty) return;

    // Get attributes from the first result and display a formatted address in a dialog.

    final firstResult = reverseGeocodeResult.first;
    print("firstResult ${firstResult.attributes.toString()}");
    final cityString = firstResult.attributes['City'] ?? '';
    final addressString = firstResult.attributes['Address'] ?? '';
    final stateString = firstResult.attributes['RegionAbbr'] ?? '';
    final resultStrings = [addressString, cityString, stateString];
    final combinedString =
    resultStrings.where((str) => str.isNotEmpty).join(', ');

    if (mounted) {
      showDialog(
        context: mContext!,
        builder: (BuildContext context) {
          return AlertDialog(content: Text(combinedString));
        },
      );
    }
  }


  void convertZoomLevel(int zoom) {

   setState(() {
     zoomLevel= 591657550.500000 / pow(2, 20);
     print("zoomLevel : $zoomLevel");
     _initialViewpoint = Viewpoint.fromCenter(
       ArcGISPoint(
         x: 76.787,
         y: 30.740,
         spatialReference: SpatialReference.wgs84,
       ),
       scale: zoomLevel,
     );
   });

  }

}




