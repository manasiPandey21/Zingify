//final url = 'http://localhost:2500/';
// final profilecreation = url.trim() + "create-profile";
import 'dart:io';

final url =
    Platform.isAndroid ? 'http://192.168.1.7:2500/' : 'http://localhost:2500/';
final registration = url + "createprofile";
final getDetails = url + "getDetails";
