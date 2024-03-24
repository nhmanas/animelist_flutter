import 'dart:async';

import 'package:animelist/app/app.dart';
import 'package:flutter/material.dart';

void runnerApp() {
  runZonedGuarded(
    () => runApp(const App()),
    (error, stackTrace) => debugPrint('$error $stackTrace'),
  );
}
