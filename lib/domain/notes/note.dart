import 'package:dartz/dartz.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/core/value_objects.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/notes/todo_item.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';
import '../core/entity.dart';
import '../core/failure.dart';

part 'note.freezed.dart';

@freezed
abstract class Note with _$Note implements IEntity {
  const factory Note({
    required UniqueId id,
    required NoteBody body,
    required NoteColor color,
    required List3<TodoItem> todos,
  }) = _Note;

  const Note._();

  factory Note.empty() => Note(
      id: UniqueId(),
      body: NoteBody(''),
      color: NoteColor(NoteColor.predefinedColors[0]),
      todos: List3(emptyList()));
  Option<ValueFailure<dynamic>> get failureOption {
    return body.failureOrUnit
        .andThen(color.failureOrUnit)
        .andThen(todos.failureOrUnit)
        .andThen(
          todos
              .getOrCrash()
              .map((todoItem) => todoItem.failureOption)
              .filter((o) => o.isSome())
              .getOrElse(0, (_) => none())
              .fold(() => right(unit), (f) => left(f)),
        )
        .fold((f) => some(f), (r) => none());
  }
}
