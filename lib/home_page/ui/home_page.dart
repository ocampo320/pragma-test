import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_pragma/core/failures/common_failure.dart';
import 'package:prueba_pragma/home_page/ui/bloc/pet_info_bloc.dart';
import 'package:prueba_pragma/home_page/ui/bloc/pet_info_event.dart';
import 'package:prueba_pragma/home_page/ui/bloc/pet_info_state.dart';
import 'package:prueba_pragma/home_page/ui/widgets/card_item_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
     context.read<PetInfoBloc>().add(
          HomeStarted(),
        );
    return BlocBuilder<PetInfoBloc, PetInfoState>(
      builder: (context, state) {
        return state.when(
          data: (pest) {
            return  SingleChildScrollView(
                  child: Column(children: pest.map((e) =>
                     CardItemWidget(
                     breeds: e,)
                  ).toList(),
                ),
              );
            
          },
          error: (CommonFailure failure) {
            return   Center(child: Text("Error ${failure.message}"));
          },
          initial: () => const SizedBox(),
          loading: () {
            return const Center(child: CircularProgressIndicator());
          },
        );
      },
    );
  }
}
