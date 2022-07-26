part of 'widgets.dart';

typedef InitCallback = void Function(Map<String, dynamic> location);

class LocationWidget extends StatefulWidget {
  const LocationWidget({Key? key, required this.locationCallback})
      : super(key: key);

  final InitCallback locationCallback;

  @override
  State<LocationWidget> createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  // get location
  final GeolocatorPlatform _geolocatorPlatform = GeolocatorPlatform.instance;
  late String messageLocation;
  late String resultLocation;
  bool loading = true;
  bool absensi = false;

  @override
  void initState() {
    getCurrentLocation();
    super.initState();
  }

  getCurrentLocation() async {
    try {
      handlePermission();
      Position position;
      position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.bestForNavigation);
      double lat = position.latitude;
      double long = position.longitude;

      debugPrint("lat $lat || long $long");
      List<Placemark> placemarks =
          await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark place = placemarks[0];
      loading = false;
      resultLocation = '${place.locality}';
      setState(() {
        if (resultLocation.isNotEmpty) {
          Map<String, dynamic> result = {
            "location": resultLocation,
            "isButtonDisabled": false
          };
          widget.locationCallback(result);
        }
      });
      absensi = true;
      return loading;
    } catch (e) {
      debugPrint("$e");
    }
  }

  Future<Position> handlePermission() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await _geolocatorPlatform.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await _geolocatorPlatform.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await _geolocatorPlatform.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    return await Geolocator.getCurrentPosition();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                const Icon(Icons.location_on),
                loading
                    ? Row(children: [
                        const Text("Mencari Lokasi "),
                        SpinKitCircle(
                          color: "C6EED8".toColor(),
                          size: 25,
                        )
                      ])
                    : Text(resultLocation),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
