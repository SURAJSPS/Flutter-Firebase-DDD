import 'package:freezed_annotation/freezed_annotation.dart';

part 'failure.freezed.dart';
/*

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;

  const factory ValueFailure.shortPassword({
    required String failedValue,
  }) = ShortPassword<T>;
  const factory ValueFailure.exceedingLength({
    required T failedValue,
    required int mex,
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.multiLine({
    required T failedValue,
  }) = MultiLine<T>;
  const factory ValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;
}
*/

/// Separated ValueFailure Function
///
/// Commented because not get how to call

@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.auth(AuthFailure<T> f) = _Auth<T>;
  const factory ValueFailure.notes(NoteValueFailure<T> f) = _Notes<T>;
}

@freezed
abstract class AuthFailure<T> with _$AuthFailure {
  const factory AuthFailure.invalidEmail({
    required String failedValue,
  }) = InvalidEmail<T>;

  const factory AuthFailure.shortPassword({
    required String failedValue,
  }) = ShortPassword<T>;
}

@freezed
abstract class NoteValueFailure<T> with _$NoteValueFailure {
  const factory NoteValueFailure.exceedingLength({
    required String failedValue,
    required int max,
  }) = ExceedingLength<T>;
  const factory NoteValueFailure.empty({
    required T failedValue,
  }) = Empty<T>;
  const factory NoteValueFailure.multiLine({
    required T failedValue,
  }) = MultiLine<T>;
  const factory NoteValueFailure.listTooLong({
    required T failedValue,
    required int max,
  }) = ListTooLong<T>;
}
