// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$User {
  UniqueId get id => throw _privateConstructorUsedError;
  StringSingleLine? get photoUrl => throw _privateConstructorUsedError;
  StringSingleLine? get refreshToken => throw _privateConstructorUsedError;
  StringSingleLine? get tenantId => throw _privateConstructorUsedError;
  StringSingleLine? get displayName => throw _privateConstructorUsedError;
  EmailAddress? get email => throw _privateConstructorUsedError;
  bool? get emailVerified => throw _privateConstructorUsedError;
  bool? get isAnonymous => throw _privateConstructorUsedError;
  StringSingleLine? get phoneNumber => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserCopyWith<User> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserCopyWith<$Res> {
  factory $UserCopyWith(User value, $Res Function(User) then) =
      _$UserCopyWithImpl<$Res, User>;
  @useResult
  $Res call(
      {UniqueId id,
      StringSingleLine? photoUrl,
      StringSingleLine? refreshToken,
      StringSingleLine? tenantId,
      StringSingleLine? displayName,
      EmailAddress? email,
      bool? emailVerified,
      bool? isAnonymous,
      StringSingleLine? phoneNumber});
}

/// @nodoc
class _$UserCopyWithImpl<$Res, $Val extends User>
    implements $UserCopyWith<$Res> {
  _$UserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? photoUrl = freezed,
    Object? refreshToken = freezed,
    Object? tenantId = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? emailVerified = freezed,
    Object? isAnonymous = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as StringSingleLine?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as StringSingleLine?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as StringSingleLine?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as StringSingleLine?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAnonymous: freezed == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as StringSingleLine?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_UserCopyWith<$Res> implements $UserCopyWith<$Res> {
  factory _$$_UserCopyWith(_$_User value, $Res Function(_$_User) then) =
      __$$_UserCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UniqueId id,
      StringSingleLine? photoUrl,
      StringSingleLine? refreshToken,
      StringSingleLine? tenantId,
      StringSingleLine? displayName,
      EmailAddress? email,
      bool? emailVerified,
      bool? isAnonymous,
      StringSingleLine? phoneNumber});
}

/// @nodoc
class __$$_UserCopyWithImpl<$Res> extends _$UserCopyWithImpl<$Res, _$_User>
    implements _$$_UserCopyWith<$Res> {
  __$$_UserCopyWithImpl(_$_User _value, $Res Function(_$_User) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? photoUrl = freezed,
    Object? refreshToken = freezed,
    Object? tenantId = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? emailVerified = freezed,
    Object? isAnonymous = freezed,
    Object? phoneNumber = freezed,
  }) {
    return _then(_$_User(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as UniqueId,
      photoUrl: freezed == photoUrl
          ? _value.photoUrl
          : photoUrl // ignore: cast_nullable_to_non_nullable
              as StringSingleLine?,
      refreshToken: freezed == refreshToken
          ? _value.refreshToken
          : refreshToken // ignore: cast_nullable_to_non_nullable
              as StringSingleLine?,
      tenantId: freezed == tenantId
          ? _value.tenantId
          : tenantId // ignore: cast_nullable_to_non_nullable
              as StringSingleLine?,
      displayName: freezed == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as StringSingleLine?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as EmailAddress?,
      emailVerified: freezed == emailVerified
          ? _value.emailVerified
          : emailVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      isAnonymous: freezed == isAnonymous
          ? _value.isAnonymous
          : isAnonymous // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as StringSingleLine?,
    ));
  }
}

/// @nodoc

class _$_User implements _User {
  const _$_User(
      {required this.id,
      this.photoUrl,
      this.refreshToken,
      this.tenantId,
      this.displayName,
      this.email,
      this.emailVerified,
      this.isAnonymous,
      this.phoneNumber});

  @override
  final UniqueId id;
  @override
  final StringSingleLine? photoUrl;
  @override
  final StringSingleLine? refreshToken;
  @override
  final StringSingleLine? tenantId;
  @override
  final StringSingleLine? displayName;
  @override
  final EmailAddress? email;
  @override
  final bool? emailVerified;
  @override
  final bool? isAnonymous;
  @override
  final StringSingleLine? phoneNumber;

  @override
  String toString() {
    return 'User(id: $id, photoUrl: $photoUrl, refreshToken: $refreshToken, tenantId: $tenantId, displayName: $displayName, email: $email, emailVerified: $emailVerified, isAnonymous: $isAnonymous, phoneNumber: $phoneNumber)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_User &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.photoUrl, photoUrl) ||
                other.photoUrl == photoUrl) &&
            (identical(other.refreshToken, refreshToken) ||
                other.refreshToken == refreshToken) &&
            (identical(other.tenantId, tenantId) ||
                other.tenantId == tenantId) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.emailVerified, emailVerified) ||
                other.emailVerified == emailVerified) &&
            (identical(other.isAnonymous, isAnonymous) ||
                other.isAnonymous == isAnonymous) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, id, photoUrl, refreshToken,
      tenantId, displayName, email, emailVerified, isAnonymous, phoneNumber);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_UserCopyWith<_$_User> get copyWith =>
      __$$_UserCopyWithImpl<_$_User>(this, _$identity);
}

abstract class _User implements User {
  const factory _User(
      {required final UniqueId id,
      final StringSingleLine? photoUrl,
      final StringSingleLine? refreshToken,
      final StringSingleLine? tenantId,
      final StringSingleLine? displayName,
      final EmailAddress? email,
      final bool? emailVerified,
      final bool? isAnonymous,
      final StringSingleLine? phoneNumber}) = _$_User;

  @override
  UniqueId get id;
  @override
  StringSingleLine? get photoUrl;
  @override
  StringSingleLine? get refreshToken;
  @override
  StringSingleLine? get tenantId;
  @override
  StringSingleLine? get displayName;
  @override
  EmailAddress? get email;
  @override
  bool? get emailVerified;
  @override
  bool? get isAnonymous;
  @override
  StringSingleLine? get phoneNumber;
  @override
  @JsonKey(ignore: true)
  _$$_UserCopyWith<_$_User> get copyWith => throw _privateConstructorUsedError;
}
