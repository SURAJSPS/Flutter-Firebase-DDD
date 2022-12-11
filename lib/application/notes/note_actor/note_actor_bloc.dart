import 'package:bloc/bloc.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/notes/i_note_repository.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/notes/note.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/notes/note_failure.dart';

part 'note_actor_event.dart';
part 'note_actor_state.dart';
part 'note_actor_bloc.freezed.dart';

class NoteActorBloc extends Bloc<NoteActorEvent, NoteActorState> {
  NoteActorBloc(this._noteRepository) : super(const _Initial()) {
    on<_Deleted>((event, emit) => delete(event, emit));
  }

  final INoteRepository _noteRepository;
  delete(_Deleted event, Emitter<NoteActorState> emit) async {
    emit(const _ActionInProgress());

    final possibleFailure = await _noteRepository.delete(event.note);

    emit(
      possibleFailure.fold(
        (f) => _DeleteFailure(f),
        (_) => const _DeleteSuccess(),
      ),
    );
  }
}
