// import 'package:flutter_firebase_ddd_with_bloc/domain/auth/value_object.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/core/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
class User with _$User {
  const factory User({
    required UniqueId id,
    /*StringSingleLine? photoUrl,
    StringSingleLine? refreshToken,
    StringSingleLine? tenantId,
    StringSingleLine? displayName,
    EmailAddress? email,
    bool? emailVerified,
    bool? isAnonymous,
    StringSingleLine? phoneNumber,*/
  }) = _User;
}
