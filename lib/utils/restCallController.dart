import 'package:get/get.dart';
import 'package:http/http.dart' as http;


class RestCallController extends GetxController {
  var res = ''.obs;

  Future postCall(
      {required body,
        required full_url,
        header,
        body_fields,
        ignore_msg}) async {
    if (!full_url.toString().contains("http")) {
      return;
    }
    var localHeaders = {
      'Content-Type': 'application/json',
    };

    var request = http.Request('POST', Uri.parse(full_url));

    if (body_fields != null && body_fields) {
      request.bodyFields = body;
    } else {
      request.body = body;
    }

    request.headers.addAll(header ?? localHeaders);

    try {
      http.StreamedResponse response = await request.send();
      var k = await (response.stream.bytesToString());
      return k;
    } catch (e) {
      return null;
    }
  }

  Future getCall(
      {required full_url,
        header}) async {
    if (!full_url.toString().contains("http")) {
      return;
    }
    var localHeaders = {
      'Content-Type': 'application/json',
    };

    var request = http.Request('Get', Uri.parse(full_url));


    request.headers.addAll(header ?? localHeaders);

    try {
      http.StreamedResponse response = await request.send();
      var k = await (response.stream.bytesToString());
      return k;
    } catch (e) {
      return null;
    }
  }

}