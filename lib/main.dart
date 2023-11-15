import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_cubit/cubit/app_cubit_logics.dart';
import 'package:flutter_cubit/cubit/app_cubits.dart';
import 'package:flutter_cubit/pages/detail_pages/cubit/store_page_info_cubits.dart';
import 'package:flutter_cubit/pages/detail_pages/detail_page.dart';
import 'package:flutter_cubit/pages/navpages/main_page.dart';
import 'package:flutter_cubit/pages/welcome_page.dart';
import 'package:flutter_cubit/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            iconTheme: IconThemeData(
              color:Colors.black
            ),
            elevation: 0,
            backgroundColor: Colors.white
          )
        ),
        home: MultiBlocProvider(
          providers: [
            BlocProvider<AppCubits>(
              create: (context) => AppCubits(
                data: DataServices(),
              ),
            ),
            BlocProvider<StorePageInfoCubits>(
              create: (context) => StorePageInfoCubits(),
            )
          ],
          child: const AppCubitLogics(),
        ));
  }
}
