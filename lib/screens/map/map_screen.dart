import 'dart:io';
import 'dart:math';

import 'package:JanSahayak/jan_sahayak.dart';
import 'package:arcgis_maps/arcgis_maps.dart';
import 'package:geolocator/geolocator.dart';
import 'dart:convert';

import '../../jan_sahayak.dart';
import '../../jan_sahayak.dart';
import '../../utils/crypto_decrypt_utils.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  double zoomLevel = 5e4;

  var list = [
    "Please Select Road Problem Type",
    "Pothole",
    "Sewage",
    "Piping Issue",
    "New Road Creation",
    "Accident BlackSpot",
    "Others",
    "Damage Road"
  ];

  var _settingsVisible = false;

  // Create the system location data source.
  final _locationDataSource = SystemLocationDataSource();

  // A subscription to receive status changes of the location data source.
  StreamSubscription? _statusSubscription;
  var _status = LocationDataSourceStatus.stopped;

  // A subscription to receive changes to the auto-pan mode.
  StreamSubscription? _autoPanModeSubscription;
  var _autoPanMode = LocationDisplayAutoPanMode.recenter;

  // A flag for when the map view is ready and controls can be used.
  var _ready = false;

  final _graphicsOverlay = GraphicsOverlay();
  final _worldLocatorTask = LocatorTask.withUri(
    Uri.parse(
      'https://geocode-api.arcgis.com/arcgis/rest/services/World/GeocodeServer',
    ),
  );

  // Create a controller for the map view.
  final _mapViewController = ArcGISMapView.createController();
  var _initialViewpoint;

  // A flag for when the map view is ready and controls can be used.

  BuildContext? mContext;
  final MapController controller = Get.put(MapController());
  ArcGISMap? map;

  @override
  void initState() {
    super.initState();
    controller.roadProblemController.text = list[0];

    _determinePosition();
    map = ArcGISMap.withBasemapStyle(controller.mapStyle);
  }

  @override
  Widget build(BuildContext context) {
    mContext = context;

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(60),
            child: CommonAppbar(title: 'app_name'.tr),
          ),
          body: GetBuilder<MapController>(
            id: 'map_screen',
            builder: (controller) {
              return StackedLoader(
                loading: controller.loader,
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      child: getmap(),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Container(
                        margin: EdgeInsets.only(top: 13, right: 10),
                        width: 50,
                        height: 50,
                        child: InkWell(
                          onTap: () {
                            if (controller.mapStyle ==
                                BasemapStyle.arcGISStreets) {
                              setState(() {
                                controller.mapStyle =
                                    BasemapStyle.arcGISImagery;
                                updateMap();
                              });
                            } else {
                              setState(() {
                                controller.mapStyle =
                                    BasemapStyle.arcGISStreets;
                                updateMap();
                              });
                            }
                          },
                          child: Align(
                            alignment: Alignment.topRight,
                            child: Image.asset(
                              controller.mapStyle == BasemapStyle.arcGISStreets
                                  ? AssetRes.base_s_a
                                  : AssetRes.base_st_p,
                              width: 50,
                              height: 50,
                            ),
                          ),
                        ),
                      ),
                    ),

                    Container(
                      margin: EdgeInsets.only(left: 10, top: 10),
                      child: Card(
                          elevation: 3,
                          child: Container(
                            width: 30,
                            height: 80,
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)),
                              color: ColorRes.white,
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      zoomIn();
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        '+'.tr,
                                        style: styleW600S16.copyWith(
                                            fontSize: 20,
                                            color: ColorRes.lightTextColor,
                                            height: 1),
                                      ),
                                    ),
                                  ),
                                ),
                                Divider(
                                  height: 1,
                                  color: ColorRes.dividerColor,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: InkWell(
                                    onTap: () {
                                      zoomOut();
                                    },
                                    child: Align(
                                      alignment: Alignment.center,
                                      child: Text(
                                        textAlign: TextAlign.center,
                                        '-'.tr,
                                        style: styleW600S16.copyWith(
                                            fontSize: 20,
                                            color: ColorRes.lightTextColor,
                                            height: 1),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        constraints: BoxConstraints(
                            minHeight: 50,
                            minWidth: double.infinity,
                            maxHeight: 340),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  currentPosition();
                                },
                                child: Container(
                                  margin: EdgeInsets.only(right: 15),
                                  width: 28,
                                  height: 28,
                                  decoration: BoxDecoration(
                                    color: ColorRes.buttonRedColor,
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Center(
                                    child: Image.asset(
                                      AssetRes.location_cur,
                                      width: 25,
                                      height: 25,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Card(
                              elevation: 3,
                              child: Container(
                                width: double.infinity,
                                constraints: BoxConstraints(
                                    minHeight: 50,
                                    minWidth: double.infinity,
                                    maxHeight: 300),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(5),
                                      topRight: Radius.circular(5)),
                                  color: ColorRes.white,
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 16, right: 16, top: 16, bottom: 10),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Text(
                                        textAlign: TextAlign.left,
                                        'Tap on the Road you want to report'.tr,
                                        style: styleW400S18.copyWith(
                                            fontSize: 12,
                                            color: ColorRes.appRedColor,
                                            height: 1),
                                      ),
                                      Visibility(
                                          visible: controller.isRoadNameShow,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              appSizedBox(height: 5),
                                              Text(
                                                textAlign: TextAlign.center,
                                                'Road Selected'.tr,
                                                style: styleW400S18.copyWith(
                                                    fontSize: 12,
                                                    color: ColorRes.black,
                                                    height: 1),
                                              ),
                                              appSizedBox(height: 5),
                                              Container(
                                                  height: 40,
                                                  width: Get.width,
                                                  alignment: Alignment.center,
                                                  padding: const EdgeInsets
                                                      .symmetric(
                                                      horizontal: 16),
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    border: Border.all(
                                                        color:
                                                            ColorRes.greyColor),
                                                    color: ColorRes.greyColor
                                                        .withOpacity(0.27),
                                                  ),
                                                  child: Align(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      controller
                                                          .roadNameController
                                                          .text,
                                                      style:
                                                          styleW400S18.copyWith(
                                                              fontSize: 13,
                                                              color: ColorRes
                                                                  .black,
                                                              height: 1),
                                                    ),
                                                  )),
                                            ],
                                          )),
                                      appSizedBox(height: 10),
                                      Text(
                                        textAlign: TextAlign.center,
                                        'Road Problem Type'.tr,
                                        style: styleW400S18.copyWith(
                                            fontSize: 12,
                                            color: ColorRes.black,
                                            height: 1),
                                      ),
                                      appSizedBox(height: 5),
                                      getDropdown(),
                                      Visibility(
                                          visible: controller.isRoadNameShow,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              appSizedBox(height: 5),
                                              Stack(
                                                children: [
                                                  InkWell(
                                                      onTap: () {
                                                        alertDialogflowCameraGallery(
                                                            mContext!);
                                                      },
                                                      child: controller
                                                              .isAseestImage
                                                          ? Image.asset(
                                                              AssetRes.photo,
                                                              width: 60,
                                                              height: 60,
                                                            )
                                                          : Image.file(
                                                              controller
                                                                  .imageFile!,
                                                              width: 60,
                                                              height: 60,
                                                            )),
                                                  Container(
                                                    width: 70,
                                                    child: Visibility(
                                                      visible: !controller
                                                          .isAseestImage,
                                                      child: InkWell(
                                                        onTap: () {
                                                          deleteImageDialogue(
                                                              mContext!);
                                                        },
                                                        child: Align(
                                                          alignment: Alignment
                                                              .topRight,
                                                          child: Image.asset(
                                                            AssetRes.ic_remove,
                                                            width: 22,
                                                            height: 22,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              )
                                            ],
                                          )),
                                      appSizedBox(height: 10),
                                      AppButton(
                                        onButtonTap: () => {
                                          if (controller.isButtonEnable)
                                            {
                                              if (controller.roadProblemController.text != list[0]){
                                                  if (controller.imageFile != null){

                                                    } else {
                                                      toastMsg('Please upload image to submit report !!')
                                                    }
                                                }
                                              else {
                                                  toastMsg(
                                                      'Please select road problem type !')
                                                }
                                            }
                                        },
                                        buttonName: 'Submit'.tr,
                                        textColor: ColorRes.white,
                                        backgroundColor:
                                            ColorRes.buttonRedColor,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                    // Centered logo
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  Widget getDropdown() {
    return Container(
      height: 40,
      width: Get.width,
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: ColorRes.greyColor),
        color: ColorRes.greyColor.withOpacity(0.27),
      ),
      child: DropdownButton(
        value: controller.roadProblemController.text.toString(),
        underline: const SizedBox(),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: ColorRes.appBlackColor,
        ),
        items: list.map((items) {
          return DropdownMenuItem(
            value: items,
            child: Text(
              items,
              style: styleW400S15.copyWith(fontSize: 14, color: ColorRes.black),
            ),
          );
        }).toList(),
        dropdownColor: ColorRes.greyColor,
        borderRadius: BorderRadius.circular(10),
        isExpanded: true,
        isDense: true,
        onChanged: (Object? value) {
          setState(() {
            print("vakue: $value");
            controller.roadProblemController.text = value.toString();
          });
        },
      ),
    );
  }

  Widget getmap() {
    if (controller.mapModel != null) {
      return ArcGISMapView(
        controllerProvider: () => _mapViewController,
        onMapViewReady: onMapViewReady,
        onTap: onTap,
      );
    } else {
      return Container();
    }
  }

  void onMapViewReady() async {
    // Create a map with the topographic basemap style and set to the map view.

    setState(() {
      controller.loader = true;
    });

    _mapViewController.arcGISMap = map;

    // Zoom to a specific extent.
    //_mapViewController.setViewpoint(_initialViewpoint);

    _mapViewController.locationDisplay.dataSource = _locationDataSource;
    _mapViewController.locationDisplay.autoPanMode =
        LocationDisplayAutoPanMode.recenter;

    // Subscribe to status changes and changes to the auto-pan mode.
    _statusSubscription = _locationDataSource.onStatusChanged.listen((status) {
      setState(() => _status = status);
    });
    setState(() => _status = _locationDataSource.status);
    _autoPanModeSubscription =
        _mapViewController.locationDisplay.onAutoPanModeChanged.listen((mode) {
      setState(() => _autoPanMode = mode);
    });
    setState(
      () => _autoPanMode = _mapViewController.locationDisplay.autoPanMode,
    );

    // Attempt to start the location data source (this will prompt the user for permission).
    try {
      await _locationDataSource.start();
    } on ArcGISException catch (e) {
      if (mounted) {
        showDialog(
          context: mContext!,
          builder: (_) => AlertDialog(content: Text(e.message)),
        );
      }
    }

    // // Create a picture marker symbol using an image asset.
    // final image = await ArcGISImage.fromAsset(AssetRes.chirayu_map);
    // final pictureMarkerSymbol = PictureMarkerSymbol.withImage(image)
    //   ..width = 35
    //   ..height = 35;
    // pictureMarkerSymbol.offsetY = pictureMarkerSymbol.height / 2;
    //
    // // Create a renderer using the picture marker symbol and set to the graphics overlay.
    // _graphicsOverlay.renderer = SimpleRenderer(symbol: pictureMarkerSymbol);
    // // Add the graphics overlay to the map view.
    // _mapViewController.graphicsOverlays.add(_graphicsOverlay);

    final mapImageLayer = ArcGISMapImageLayer.withUri(
      Uri.parse(
        controller.mapModel!.map![0].roadlayers!,
      ),
    );
    map!.operationalLayers.add(mapImageLayer);
    // Load the map image layer.

    await _worldLocatorTask.load();
    await mapImageLayer.load();

    setState(() => _ready = true);
    setState(() {
      convertZoomLevel(17);
      controller.loader = false;
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
    final InputX = firstResult.attributes['X'] ?? '';
    final InputY = firstResult.attributes['Y'] ?? '';

    print("lat : ${InputX} long : ${InputY}");
    final resultStrings = [
      addressString,
      cityString,
      stateString,
    ];
    final combinedString =
        resultStrings.where((str) => str.isNotEmpty).join(', ');

    controller.distance = calculateDistance(
        InputY, InputX, controller.latitiude!, controller.longitude!);

    if (controller.distance! < double.parse(controller.distanceMetersAPI)) {
      controller.cameraDistanceCheck = true;
    } else {
      controller.cameraDistanceCheck = false;
    }
    controller.isButtonEnable = true;
    controller.getRoadNameEncrypt(InputX, InputY);
    print("Distance : ${controller.distance}");
  }

  void convertZoomLevel(int zoom) {
    setState(() {
      zoomLevel = 591657550.500000 / pow(2, 20);
      print("zoomLevel : $zoomLevel");
    });
  }

  void updateMap() {
    // Update the map view with the selected basemap.
    controller.mapStyle;
    Basemap base = Basemap.withStyle(controller.mapStyle);

    map!.basemap = base;
  }

  void zoomIn() {
    Viewpoint? currentViewpoint = _mapViewController.getCurrentViewpoint(
        viewpointType: ViewpointType.centerAndScale);

    // Zoom in by increasing the scale (e.g., by half)
    double newScale = currentViewpoint!.targetScale * 0.5;

    final extent = currentViewpoint.targetGeometry.extent.center;

    // Set the new viewpoint with the updated scale

    Viewpoint.fromCenter(
      currentViewpoint.targetGeometry.extent.center,
      scale: newScale,
    );

    Viewpoint? newViewpoint = Viewpoint.fromCenter(
      currentViewpoint.targetGeometry.extent.center,
      scale: newScale,
    );
    _mapViewController.setViewpoint(newViewpoint);
  }

  void zoomOut() {
    Viewpoint? currentViewpoint = _mapViewController.getCurrentViewpoint(
        viewpointType: ViewpointType.centerAndScale);

    // Zoom in by increasing the scale (e.g., by half)
    double newScale = currentViewpoint!.targetScale * 2.0;

    // Set the new viewpoint with the updated scale

    Viewpoint.fromCenter(
      currentViewpoint.targetGeometry.extent.center,
      scale: newScale,
    );

    Viewpoint? newViewpoint = Viewpoint.fromCenter(
      currentViewpoint.targetGeometry.extent.center,
      scale: newScale,
    );
    _mapViewController.setViewpoint(newViewpoint);
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    var location = await Geolocator.getCurrentPosition();
    print("location : ${location.latitude}  ${location.longitude}");
    controller.latitiude = location.latitude;
    controller.longitude = location.longitude;
    String latString = location.latitude.toStringAsFixed(3);
    String longString = location.longitude.toStringAsFixed(3);

    print("location : ${latString}  ${longString}");
    double lat = double.parse(latString);
    double long = double.parse(longString);

    _initialViewpoint = Viewpoint.fromCenter(
      ArcGISPoint(
        x: lat,
        y: long,
        spatialReference: SpatialReference.wgs84,
      ),
      scale: zoomLevel,
    );
    setState(() {});

    map!.initialViewpoint = _initialViewpoint;
  }

  void currentPosition() async {
    _mapViewController.locationDisplay.dataSource = _locationDataSource;
    _mapViewController.locationDisplay.autoPanMode =
        LocationDisplayAutoPanMode.recenter;

    // Subscribe to status changes and changes to the auto-pan mode.
    _statusSubscription = _locationDataSource.onStatusChanged.listen((status) {
      setState(() => _status = status);
    });
    setState(() => _status = _locationDataSource.status);
    _autoPanModeSubscription =
        _mapViewController.locationDisplay.onAutoPanModeChanged.listen((mode) {
      setState(() => _autoPanMode = mode);
    });
    setState(
      () => _autoPanMode = _mapViewController.locationDisplay.autoPanMode,
    );

    // Attempt to start the location data source (this will prompt the user for permission).
    try {
      await _locationDataSource.start();
    } on ArcGISException catch (e) {
      if (mounted) {
        showDialog(
          context: mContext!,
          builder: (_) => AlertDialog(content: Text(e.message)),
        );
      }
    }
  }

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p =
        0.017453292519943295; //conversion factor from radians to decimal degrees, exactly math.pi/180
    var c = cos;
    var a = 0.5 -
        c((lat2 - lat1) * p) / 2 +
        c(lat1 * p) * c(lat2 * p) * (1 - c((lon2 - lon1) * p)) / 2;
    var radiusOfEarth = 6371;

    return radiusOfEarth * 2 * asin(sqrt(a)) * 1000;
  }

  void alertDialogForDistance(BuildContext context) {
    // Create AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Alert Dialog"),
          content: Text(
              "Camera is disabled due to map location is far from current location (${controller.distance} meters)"),
          actions: <Widget>[
            TextButton(
              child: Text("OK"),
              onPressed: () {
                // Handle positive button click
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void alertDialogflowCameraGallery(BuildContext context) {
    // Create AlertDialog builder
    AlertDialog alertDialog = AlertDialog(
      title: Text("Alert Dialog"),
      content: Text("Choose Media to upload image"),
      actions: [
        TextButton(
          onPressed: () {
            // Handle positive button click
            Navigator.of(context).pop();
            if (controller.cameraDistanceCheck) {
              ImagePicker()
                  .pickImage(
                source: ImageSource.camera,
                imageQuality: 16,
              )
                  .then((image) {
                // Handle the image
                print("Image : ${image!.path}");
                setState(() {
                  controller.photoSource="0";
                  controller.isAseestImage = false;
                  controller.imageFile = File(image!.path);
                });
              });
              controller.checkPhotoSource = true;
            } else {
              alertDialogForDistance(mContext!);
            }
          },
          child: Text("Camera"),
        ),
        TextButton(
          onPressed: () {
            // Handle negative button click
            Navigator.of(context).pop();
            controller.checkPhotoSource = false;

            ImagePicker()
                .pickImage(
              source: ImageSource.gallery,
              imageQuality: 16,
            )
                .then((image) {
              print("Image : ${image!.path}");
              // Handle the image
              setState(() {
                controller.photoSource="1";
                controller.isAseestImage = false;
                controller.imageFile = File(image!.path);
              });
            });
          },
          child: Text("Gallery"),
        ),
        TextButton(
          onPressed: () {
            // Handle neutral button click
            Navigator.of(context).pop();
          },
          child: Text("Close"),
        ),
      ],
    );

    // Create and show the AlertDialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alertDialog;
      },
    );
  }

  void deleteImageDialogue(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(" Alert !"),
          content: Text("Do you want to remove image ?"),
          actions: <Widget>[
            TextButton(
              child: Text("No"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text("Yes"),
              onPressed: () {
                // Handle positive button click
                setState(() {
                  controller.imageFile = null;
                  controller.isAseestImage = true;
                });
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
