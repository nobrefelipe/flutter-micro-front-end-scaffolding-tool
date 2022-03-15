import 'package:micro_core/micro_core.dart';

//
// * DUMMY USECASE

// create the class extending Usecase
// providing the Input and Output types
// see: https://github.com/ShiftGroupLtd/flutter-micro-core/tree/master/lib/utils/usecases
//
class SomeUsecase extends Usecase<DateParams, String> {
  Future<Either<IFailure, Output>> call(DateParams params) {
    // implementation goes here
    // final date = params.date;
    // return Right('String');
  }
}

// Provide you input type
class DateParams extends Params {
  final String date;
  DateParams(this.date);
}
