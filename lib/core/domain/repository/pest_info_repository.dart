import 'package:dartz/dartz.dart';
import 'package:prueba_pragma/core/domain/models/pet_model.dart';
import 'package:prueba_pragma/core/domain/services/pet_info_services.dart';
import 'package:prueba_pragma/core/failures/common_failure.dart';
import 'package:prueba_pragma/core/domain/models/beeds.dart';
class PetInfoRepository{
  Future<Either<CommonFailure, List<Breeds>>> getInfoPet() async {
    try {
         final data  = await PestInfoServices.getInfoPet();
      return right(data);
    } catch (e) {
      return left(CommonFailure.data(message: e.toString()));
    }
  }
}