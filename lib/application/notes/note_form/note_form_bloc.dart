import 'dart:ui';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/notes/i_note_repository.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/notes/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kt_dart/kt.dart';

import '../../../domain/notes/note.dart';
import '../../../domain/notes/note_failure.dart';
import '../../../presentation/notes/note_form/misc/todo_item_presentation_classes.dart';

part 'note_form_bloc.freezed.dart';
part 'note_form_event.dart';
part 'note_form_state.dart';

@injectable
class NoteFormBloc extends Bloc<NoteFormEvent, NoteFormState> {
  NoteFormBloc(this._noteRepository) : super(NoteFormState.initial()) {
    on<_Initialize>((event, emit) => initialize(event, emit));
    on<_BodyChanged>((event, emit) => bodyChanged(event, emit));
    on<_ColorChanged>((event, emit) => colorChanged(event, emit));
    on<_TodosChanged>((event, emit) => todosChanged(event, emit));
    on<_Saved>((event, emit) => saved(event, emit));
  }
  final INoteRepository _noteRepository;
  initialize(_Initialize event, Emitter<NoteFormState> emit) {
    emit(
      event.initialNoteOption.fold(
        () => state,
        (initialNote) => state.copyWith(isEditing: true, note: initialNote),
      ),
    );
  }

  bodyChanged(_BodyChanged event, Emitter<NoteFormState> emit) {
    emit(
      state.copyWith(
        note: state.note.copyWith(
          body: NoteBody(event.bodyString),
        ),
        saveFailureOrSuccessOption: none(),
      ),
    );
  }

  colorChanged(_ColorChanged event, Emitter<NoteFormState> emit) {
    emit(state.copyWith(
        note: state.note.copyWith(color: NoteColor(event.color))));
  }

  todosChanged(_TodosChanged event, Emitter<NoteFormState> emit) {
    emit(state.copyWith(
        note: state.note.copyWith(
            todos:
                List3(event.todos.map((primitive) => primitive.toDomain())))));
  }

  saved(_Saved event, Emitter<NoteFormState> emit) async {
    Either<NoteFailure, Unit>? failureOrSuccess;

    emit(
      state.copyWith(
        isSaving: true,
        saveFailureOrSuccessOption: none(),
      ),
    );

    if (state.note.failureOption.isNone()) {
      failureOrSuccess = state.isEditing
          ? await _noteRepository.update(state.note)
          : await _noteRepository.create(state.note);
    }

    emit(
      state.copyWith(
        isSaving: false,
        showErrorMessages: AutovalidateMode.onUserInteraction,
        saveFailureOrSuccessOption: optionOf(failureOrSuccess),
      ),
    );
  }
}
