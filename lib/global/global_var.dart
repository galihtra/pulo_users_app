import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

String userName = "";
String userPhone = "";
String userID = FirebaseAuth.instance.currentUser!.uid;

String googleMapKey = "AIzaSyC6LgH8lt4IILgH2KaM-Nk9V2jcpomkiu4";
String serverKeyFCM = "AAAAkFWosfE:APA91bGBxB05F58WfBkJ112T92DMbeua9L1Y2ygWKFlnqBv1g_MCSUHpiUdmEqU19tgEqzaSucgE3bNFz9U_PRrdpEqbTEHLGS4fi_y2lYK2QZbk5cnrSwqWzYahv36agB3t9ZHih59H";

const CameraPosition googlePlexInitialPosition = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
);