import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kt_dart/collection.dart';

import '../../../domain/notes/i_note_repository.dart';
import '../../../domain/notes/note.dart';
import '../../../domain/notes/note_failure.dart';

part 'note_watcher_event.dart';
part 'note_watcher_state.dart';
part 'note_watcher_bloc.freezed.dart';

class NoteWatcherBloc extends Bloc<NoteWatcherEvent, NoteWatcherState> {
  NoteWatcherBloc(this._noteRepository)
      : super(const NoteWatcherState.initial()) {
    on<WatchAllStarted>((event, emit) => watchAllStarted(event, emit));
    on<WatchUncompletedStarted>(
        (event, emit) => watchUncompletedStarted(event, emit));
    on<NotesReceived>((event, emit) => notesReceived(event, emit));
  }

  final INoteRepository _noteRepository;

  StreamSubscription<Either<NoteFailure, KtList<Note>>>?
      _noteStreamSubscription;

  Future<void> watchAllStarted(
      WatchAllStarted event, Emitter<NoteWatcherState> emit) async {
    emit(const NoteWatcherState.loadInProgress());
    await _noteStreamSubscription?.cancel();
    _noteStreamSubscription = _noteRepository.watchAll().listen(
        (failureOrNote) => add(NoteWatcherEvent.notesReceived(failureOrNote)));
  }

  Future<void> watchUncompletedStarted(
      WatchUncompletedStarted event, Emitter<NoteWatcherState> emit) async {
    emit(const NoteWatcherState.loadInProgress());
    await _noteStreamSubscription?.cancel();
    _noteStreamSubscription = _noteRepository.watchUncompleted().listen(
          (failureOrNote) => add(NoteWatcherEvent.notesReceived(failureOrNote)),
        );
  }

  void notesReceived(NotesReceived event, Emitter<NoteWatcherState> emit) {
    emit(
      event.failureOrNote.fold(
        (f) => NoteWatcherState.loadFailure(f),
        (notes) => NoteWatcherState.loadSuccess(notes),
      ),
    );
  }

  @override
  Future<void> close() async {
    await _noteStreamSubscription?.cancel();
    return super.close();
  }
}
