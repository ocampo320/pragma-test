import 'package:prueba_pragma/core/domain/models/beeds.dart';
import 'package:prueba_pragma/core/domain/models/pet_model.dart';
import 'package:prueba_pragma/core/failures/common_failure.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'pet_info_state.freezed.dart';

@freezed
abstract class PetInfoState with _$PetInfoState {
const PetInfoState._();
  const factory PetInfoState.initial() = _Initial;

  const factory PetInfoState.loading() = _Loading;

  const factory PetInfoState.data({required List<Breeds> pest}) = _Data;

  const factory PetInfoState.error({
    required CommonFailure failure,
  }) = _Error;

}