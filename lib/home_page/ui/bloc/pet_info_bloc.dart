import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:prueba_pragma/core/domain/repository/pest_info_repository.dart';
import 'package:prueba_pragma/home_page/ui/bloc/pet_info_event.dart';
import 'package:prueba_pragma/home_page/ui/bloc/pet_info_state.dart';

class PetInfoBloc extends Bloc<PetInfoEvent, PetInfoState> {
  final PetInfoRepository petInfoRepository;
   PetInfoBloc(this.petInfoRepository) : super(const PetInfoState.initial()) {
    on<HomeStarted>(getData);

  }

  FutureOr<void> getData(HomeStarted event, Emitter<PetInfoState> emit) async {
    emit(const PetInfoState.loading());
    final state = await petInfoRepository.getInfoPet();
    emit(
    await  state.fold(
        (error) => PetInfoState.error(failure: error),
        (data) => PetInfoState.data(pest: data),
      ),
    );
  }
  
}

