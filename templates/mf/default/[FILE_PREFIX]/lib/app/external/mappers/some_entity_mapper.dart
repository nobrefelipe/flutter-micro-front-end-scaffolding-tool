import '../../domain/entities/some_entity.dart';

class SomeEntityMapper {
  static SomeEntity fromMap(dynamic map) {
    return SomeEntity(
      name: map['name'],
    );
  }

  static Map<dynamic, dynamic> toMap(SomeEntity trailer) {
    return {
      'name': trailer.name,
    };
  }
}
