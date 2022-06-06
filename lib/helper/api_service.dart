import 'package:api_app/model/post.dart';
import 'package:http/http.dart' as http;

class PostHelper {
  Future<List<PostModel>?> getPost() async {
    var response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      var data = response.body;
      print("data: $data");
      return postFromJson(data);
    }
  }
}
