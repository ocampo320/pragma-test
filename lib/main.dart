import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_pragma/core/domain/repository/pest_info_repository.dart';
import 'package:prueba_pragma/home_page/ui/bloc/pet_info_bloc.dart';
import 'package:prueba_pragma/home_page/ui/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => PetInfoRepository(),
        ),
      ],
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => PetInfoBloc(PetInfoRepository()))
        ],
        child: MaterialApp(
          title: 'Pets',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: Scaffold(
              appBar: AppBar(),
              body: const SafeArea(
                child: HomePage(),
              )),
        ),
      ),
    );
  }
}
