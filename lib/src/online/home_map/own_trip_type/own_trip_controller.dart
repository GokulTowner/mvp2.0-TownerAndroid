import 'dart:developer';
import 'package:geolocator/geolocator.dart' as geolocator;
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';
import '../../../../imports.dart';

class OwnTripServiceTypeProvider extends ChangeNotifier {
  OwnTripServiceTypeProvider() {
    checkPermissionsAndGetLocation();
    getSuggestions('');
  }
  int _selectedOption = 1;
  int get selectedOption => _selectedOption;

  void selectOption(int option) {
    _selectedOption = option;
    notifyListeners();
  }

  void proceed(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => OwnTripServiceTypeScreen(flag: _selectedOption),
      ),
    );
  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _pickupController = TextEditingController();
  final TextEditingController _dropController = TextEditingController();
  final TextEditingController _couponController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  TextEditingController get nameController => _nameController;
  TextEditingController get mobileController => _mobileController;
  TextEditingController get pickupController => _pickupController;
  TextEditingController get dropController => _dropController;
  TextEditingController get couponController => _couponController;
  TextEditingController get startDateController => _startDateController;
  TextEditingController get endDateController => _endDateController;

  String apiKey = 'AIzaSyB5OKTzO6adnQsJiI-17O9rd2-eSMz2vQo';

  bool isChecked = false;
  String groupValue = '1';

  void setGroupValue(String value) {
    groupValue = value;
    notifyListeners();
  }

  void toggleCheckbox() {
    isChecked = !isChecked;
    notifyListeners();
  }

  @override
  void dispose() {
    nameController.dispose();
    mobileController.dispose();
    pickupController.dispose();
    dropController.dispose();
    couponController.dispose();
    startDateController.dispose();
    endDateController.dispose();
    super.dispose();
  }

  final TextEditingController _currentLocationController =
      TextEditingController();
  final TextEditingController _destinationController = TextEditingController();
  geolocator.Position?
      _currentPosition; // Use 'geolocator.Position' instead of 'Position'
  final Dio _dio = Dio();
  List<dynamic> _currentLocationSuggestions = [];
  List<dynamic> _destinationSuggestions = [];
  bool _isCurrentLocationField = true;
  LatLng? _pickupLatLng;
  LatLng? _destinationLatLng;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};
  String? _distanceText;
  String? _durationText;
  GoogleMapController? _mapController;

  TextEditingController get currentLocationController =>
      _currentLocationController;
  TextEditingController get destinationController => _destinationController;
  geolocator.Position? get currentPosition => _currentPosition;
  List<dynamic> get currentLocationSuggestions => _currentLocationSuggestions;
  List<dynamic> get destinationSuggestions => _destinationSuggestions;
  bool get isCurrentLocationField => _isCurrentLocationField;
  LatLng? get pickupLatLng => _pickupLatLng;
  LatLng? get destinationLatLng => _destinationLatLng;
  Set<Marker> get markers => _markers;
  Set<Polyline> get polylines => _polylines;
  String? get distanceText => _distanceText;
  String? get durationText => _durationText;
  GoogleMapController? get mapController => _mapController;

  final DateFormat _dateFormat = DateFormat('d MMM yyyy');

  final formKey = GlobalKey<FormState>();

  void initMapController(GoogleMapController controller) {
    _mapController = controller;
  }

  void selectDate(BuildContext context, bool isStartDate) async {
    DateTime initialDate = DateTime.now();
    if (isStartDate && startDateController.text.isNotEmpty) {
      initialDate = _dateFormat.parse(startDateController.text);
    } else if (!isStartDate && endDateController.text.isNotEmpty) {
      initialDate = _dateFormat.parse(endDateController.text);
    }

    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );

    if (pickedDate != null) {
      final formattedDate = _dateFormat.format(pickedDate);
      if (isStartDate) {
        startDateController.text = formattedDate;
      } else {
        endDateController.text = formattedDate;
      }
      notifyListeners();
    }
  }

  Future<void> checkPermissionsAndGetLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await geolocator.Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw 'Location services are disabled.';
    }

    permission = await geolocator.Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await geolocator.Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        throw 'Location permissions are denied';
      }
    }

    if (permission == LocationPermission.deniedForever) {
      throw 'Location permissions are permanently denied';
    }

    await getCurrentLocation();
  }

  void updateCurrentLocationField(bool newValue) {
    _isCurrentLocationField = newValue;
  }

  Future<void> getCurrentLocation() async {
    geolocator.Position position =
        await geolocator.Geolocator.getCurrentPosition(
            desiredAccuracy: LocationAccuracy.high);
    _currentPosition = position;
    await moveCameraToPosition(position);
  }

  Future<void> moveCameraToPosition(geolocator.Position position) async {
    _mapController?.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target: LatLng(position.latitude, position.longitude),
          zoom: 14.0,
        ),
      ),
    );
  }

  Future<void> getSuggestions(String query) async {
    final response = await _dio.get(
      'https://maps.googleapis.com/maps/api/place/autocomplete/json',
      queryParameters: {
        'input': query,
        'key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      if (_isCurrentLocationField) {
        _currentLocationSuggestions = response.data['predictions'];
      } else {
        _destinationSuggestions = response.data['predictions'];
      }
      notifyListeners();
    } else {
      log('Failed to load suggestions');
    }
  }

  Future<void> searchLocation(String placeId, String description) async {
    final response = await _dio.get(
      'https://maps.googleapis.com/maps/api/place/details/json',
      queryParameters: {
        'place_id': placeId,
        'key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final location = response.data['result']['geometry']['location'];
      final LatLng latLng = LatLng(location['lat'], location['lng']);

      _mapController?.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(target: latLng, zoom: 14.0),
        ),
      );

      if (_isCurrentLocationField) {
        _currentLocationController.text = description;
        _pickupLatLng = latLng;
        _currentLocationSuggestions = [];
        addPickupMarker(latLng);
      } else {
        _destinationController.text = description;
        _destinationLatLng = latLng;
        _destinationSuggestions = [];
        addDestinationMarker(latLng);
        getRoute();
      }
      notifyListeners();
    } else {
      log('Failed to load place details');
    }
  }

  void addPickupMarker(LatLng latLng) {
    _markers.add(
      Marker(
        markerId: const MarkerId('pickup'),
        position: latLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
    );
  }

  void addDestinationMarker(LatLng latLng) {
    _markers.add(
      Marker(
        markerId: const MarkerId('destination'),
        position: latLng,
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  Future<void> getRoute() async {
    if (_pickupLatLng == null || _destinationLatLng == null) {
      return;
    }

    final response = await _dio.get(
      'https://maps.googleapis.com/maps/api/directions/json',
      queryParameters: {
        'origin': '${_pickupLatLng!.latitude},${_pickupLatLng!.longitude}',
        'destination':
            '${_destinationLatLng!.latitude},${_destinationLatLng!.longitude}',
        'key': apiKey,
      },
    );

    if (response.statusCode == 200) {
      final route = response.data['routes'][0];
      final polylinePoints = route['overview_polyline']['points'];
      final distance = route['legs'][0]['distance']['text'];
      final duration = route['legs'][0]['duration']['text'];
      final polylineCoordinates = _decodePolyline(polylinePoints);

      _distanceText = distance;
      _durationText = duration;
      _polylines.add(
        Polyline(
          polylineId: const PolylineId('route'),
          points: polylineCoordinates,
          color: cBlueMain,
          width: 5,
        ),
      );
      notifyListeners();
    } else {
      log('Failed to load route');
    }
  }

  List<LatLng> _decodePolyline(String polyline) {
    List<LatLng> points = [];
    int index = 0, len = polyline.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = polyline.codeUnitAt(index++) - 63;
        result |= (b & 0x1F) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      points.add(LatLng(lat / 1E5, lng / 1E5));
    }

    return points;
  }

  String? currentLocationValidation(
      String? currentLocationValue, BuildContext context) {
    log('Pickup Location $currentLocationValue');
    if (currentLocationValue == null || currentLocationValue.isEmpty) {
      return 'Pick up location';
    }
    return null;
  }

  String? destinationValidation(
      String? destinationValue, BuildContext context) {
    log('Drop Location $destinationValue');
    if (destinationValue == null || destinationValue.isEmpty) {
      return 'Drop location';
    }
    return null;
  }

  void clearSearchPickUp() {
    _currentLocationController.clear();
    _pickupLatLng = null;
    _currentLocationSuggestions = [];
    _destinationSuggestions = [];
    _markers = {};
    _polylines = {};
    _distanceText = null;
    _durationText = null;
    notifyListeners();
  }

  void clearSearchDestination() {
    _destinationController.clear();
    _destinationLatLng = null;
    _currentLocationSuggestions = [];
    _destinationSuggestions = [];
    _markers = {};
    _polylines = {};
    _distanceText = null;
    _durationText = null;
    notifyListeners();
  }

  Future<bool> postDailyRideData(
      BuildContext context, String searchQuery) async {
    DailyRideService pickupService = DailyRideService();
    OwnTripModel data = OwnTripModel(
      pickUpLocation: _currentLocationController.text,
      pickUpLatLng: LocationLatLng(
        latitude: _pickupLatLng!.latitude.toString(),
        longitude: _pickupLatLng!.longitude.toString(),
      ),
      dropLocation: _destinationController.text,
      dropLatLng: LocationLatLng(
        latitude: _destinationLatLng!.latitude.toString(),
        longitude: _destinationLatLng!.longitude.toString(),
      ),
      userId: 'userId',
      serviceType: 'Daily',
      coupon: _couponController.text,
    );

    final result = await pickupService.postPickupData(data);
    if (result != null && result['status'] == true) {
      // Navigator.push(
      //   context,
      //   MaterialPageRoute(
      //     builder: (context) => const DailyRide(),
      //   ),
      // );
      clearTextControllers();
      log('pickup msg: ${result['message']}');
      Fluttertoast.showToast(msg: result['message']);
      return true;
    } else {
      Fluttertoast.showToast(msg: 'Something went wrong');
      return false;
    }
  }

  void clearTextControllers() {
    _currentLocationController.clear();
    _destinationController.clear();
  }

  void proceedFunction(BuildContext context) {
    if (_pickupLatLng != null && _destinationLatLng != null) {
      log('Pickup Location latitude: ${_pickupLatLng!.latitude}, Pickup Location longitude: ${_pickupLatLng!.longitude}');
      log('Drop Location latitude: ${_destinationLatLng!.latitude},Drop Location longitude: ${_destinationLatLng!.longitude}');
      log('Estimated Distance: $_distanceText');
      log('Estimated Duration: $_durationText');
      postDailyRideData(context, 'searchQuery');
    }
  }
}
