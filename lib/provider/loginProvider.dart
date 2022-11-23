import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginprovider =
    StateNotifierProvider<LoginProvider, bool>(((ref) => LoginProvider(false)));
//login provider used for changing state.
class LoginProvider extends StateNotifier<bool> {
  LoginProvider(super.state);

  void loginstate() {
    state = !state;
  }
}
