import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './http-post/models/http_provider.dart';

// import './http-post/pages/home_stateful.dart';
import './http-post/pages/home_provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: HomeStateful(),
      home: ChangeNotifierProvider(
        create: (context) => HttpProvider(),
        child: HomeProvider(),
      ),
    );
  }
}
