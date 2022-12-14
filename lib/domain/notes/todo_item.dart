import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/core/value_objects.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../core/failure.dart';
part 'todo_item.freezed.dart';

@freezed
abstract class TodoItem implements _$TodoItem {
  const factory TodoItem({
    required UniqueId id,
    required TodoName name,
    required bool done,
  }) = _TodoItem;

  const TodoItem._();

  factory TodoItem.empty() => TodoItem(
        id: UniqueId(),
        name: TodoName(''),
        done: false,
      );

  Option<ValueFailure<dynamic>> get failureOption {
    return name.value.fold((f) => some(f), (_) => none());
  }
}
