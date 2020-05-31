import 'package:provider_architecture/core/enums/view_state.dart';
import 'package:provider_architecture/core/services/authentication_service.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class LoginModel extends BaseModel {
  final AuthenticationService _authenticationService =
      locator<AuthenticationService>();
  String errormessage;

  Future<bool> login(String userIdText) async {
    setState(ViewState.Busy);

    var userId = int.tryParse(userIdText);

    if (userId == null) {
      errormessage = "Value Entered is not a number";
      setState(ViewState.Idle);
      return false;
    }
    if (userId > 10 || userId < 1) {
      errormessage = "Value Entered is not in range";
      setState(ViewState.Idle);
      return false;
    }

    var success = await _authenticationService.login(userId);

    setState(ViewState.Idle);
    return success;
  }
}
