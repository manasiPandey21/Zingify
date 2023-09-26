import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zingify/screens/authChecker.dart';
import 'package:zingify/screens/errorpage.dart';
import 'package:zingify/screens/interests.dart';
import 'package:zingify/screens/loading.dart';
import 'package:zingify/screens/editprofile.dart';
import 'package:zingify/screens/profile.dart';
import 'package:appcheck/appcheck.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(ProviderScope(child: MyApp()));
}

final firebaseInitializerProvider = FutureProvider<FirebaseApp>((ref) async {
  return await Firebase.initializeApp();
});

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final initialize = ref.watch(firebaseInitializerProvider);
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: initialize.when(
          data: (data) {
            return AuthChecker();
          },
          error: (error, stackTrace) => ErrorScreen(error, stackTrace),
          loading: () => LoadingScreen(),
        ));
  }
}
