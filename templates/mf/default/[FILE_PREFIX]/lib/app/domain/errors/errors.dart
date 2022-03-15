import 'package:micro_core/micro_core.dart';

// Implement your errors here
class DataNotFound extends IFailure {
  DataNotFound(String message) : super(message);
}
