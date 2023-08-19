import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zingify/screens/errorpage.dart';
import 'package:zingify/screens/homePage.dart';
import 'package:zingify/screens/loading.dart';

import '../providers/authprovider.dart';
import 'login.dart';

class AuthChecker extends ConsumerWidget {
  const AuthChecker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _authState = ref.watch(authStateProvider);
    return _authState.when(
        data: (data) {
          if (data != null) return HomePage();
          return LoginPage();
        },
        error: (e, StackTrace) => ErrorScreen(e,StackTrace),
        loading: () => LoadingScreen());
  }
}
