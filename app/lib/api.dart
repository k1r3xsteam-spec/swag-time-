import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class Api {
  static const base = "https://swag-time.onrender.com";

  static Future<Map<String, dynamic>> username(String name) => _get("/username/$name");
  static Future<Map<String, dynamic>> email(String addr) => _get("/email/$addr");
  static Future<Map<String, dynamic>> domain(String dom) => _get("/domain/$dom");
  static Future<Map<String, dynamic>> url(String url) =>
      _get("/url?url=${Uri.encodeComponent(url)}");
  static Future<Map<String, dynamic>> phone(String num) => _get("/phone/$num");

  static Future<Map<String, dynamic>> exif(File f) async {
    final req = http.MultipartRequest("POST", Uri.parse("$base/exif"))
      ..files.add(await http.MultipartFile.fromPath("file", f.path));
    final res = await req.send();
    return jsonDecode(await res.stream.bytesToString());
  }

  static Future<Map<String, dynamic>> _get(String path) async {
    final r = await http.get(Uri.parse("$base$path"));
    return jsonDecode(r.body) as Map<String, dynamic>;
  }
}