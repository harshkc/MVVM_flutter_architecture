import 'dart:async';

import 'package:provider_architecture/core/models/user.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/locator.dart';

class AuthenticationService {
  Api _api = locator<Api>();
  StreamController<User> userController = StreamController<User>();

  Future<bool> login(int userId) async {
    //Fetch user by id
    var fetchedUser = await _api.getUserProfile(userId);
    bool hasUser = fetchedUser != null;
    if (hasUser) {
      userController.add(fetchedUser);
    }
    return hasUser;
  }
}
