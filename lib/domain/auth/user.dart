import 'package:flutter_firebase_ddd_with_bloc/domain/core/value_object.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const factory User({
    required UniqueId id,
  }) = _User;
}
