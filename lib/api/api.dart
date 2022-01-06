
import 'package:fluter_api/models/photos_model.dart';
import 'package:http/http.dart' show Client;

class Api {
  var baseUrl = Uri.parse('https://jsonplaceholder.typicode.com/photos') ;

  final Client _client = Client();

  Future<List<Photos>> getFoto() async {
    List<Photos> _photoList;

    final _response = await _client.get(baseUrl);
    _photoList = photosFromJson(_response.body);

    return _photoList;
  }
  
}
