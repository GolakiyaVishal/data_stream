import 'dart:async';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import 'a1_data.dart';
import 'package:http/http.dart' as http;

class DataRepository {
  static final DataRepository _instance = DataRepository._internal();
  factory DataRepository() => _instance;
  DataRepository._internal();

  final _a1Controller = StreamController<A1Data>.broadcast();
  Stream<A1Data> get a1Stream => _a1Controller.stream;
  A1Data? _cache;
  Future<A1Data>? _pending;

  Future<A1Data> fetchA1({bool forceRefresh = false}) async {
    if (_cache != null && !forceRefresh) {
      _a1Controller.add(_cache!);
      return _cache!;
    }

    if (_pending != null) return _pending!;

    _pending = _fetchFromApi().then((data) async {
      _cache = data;
      _a1Controller.add(data);
      await _saveToPrefs(data);
      _pending = null;
      return data;
    }).catchError((e) {
      _a1Controller.addError(e);
      _pending = null;
      throw e;
    });

    return _pending!;
  }

  Future<A1Data> _fetchFromApi() async {
    final res = await http.get(Uri.parse('https://example.com/api/a1'));
    if (res.statusCode != 200) {
      throw Exception('API Error: ${res.statusCode}');
    }
    return A1Data.fromJson(json.decode(res.body));
  }

  Future<void> _saveToPrefs(A1Data data) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('a1_cache', json.encode(data.toJson()));
  }

  Future<A1Data?> loadFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonStr = prefs.getString('a1_cache');
    if (jsonStr == null) return null;
    final jsonMap = json.decode(jsonStr);
    _cache = A1Data.fromJson(jsonMap);
    _a1Controller.add(_cache!);
    return _cache;
  }
}