import 'package:provider_architecture/core/enums/view_state.dart';
import 'package:provider_architecture/core/models/comment.dart';
import 'package:provider_architecture/core/services/api.dart';
import 'package:provider_architecture/core/viewmodels/base_model.dart';
import 'package:provider_architecture/locator.dart';

class CommentModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}
