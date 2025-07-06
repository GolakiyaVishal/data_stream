import 'package:flutter/material.dart';

import 'data/data_repository.dart';
import 'screens/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DataRepository().loadFromPrefs();
  runApp(const MyApp());
}
