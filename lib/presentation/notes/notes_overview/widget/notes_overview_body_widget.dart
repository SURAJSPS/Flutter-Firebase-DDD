import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd_with_bloc/presentation/notes/notes_overview/widget/critical_failure_display_widget.dart';

import '../../../../application/notes/note_watcher/note_watcher_bloc.dart';
import '../../../core/widget/loader_widget.dart';
import 'error_note_card_widget.dart';
import 'note_card_widget.dart';

class NotesOverViewBody extends StatelessWidget {
  const NotesOverViewBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteWatcherBloc, NoteWatcherState>(
      builder: (context, state) {
        return state.map(
          initial: (_) => Container(),
          loadInProgress: (_) => const LoaderWidget(),
          loadSuccess: (state) {
            return ListView.builder(
                itemCount: state.notes.size,
                itemBuilder: (context, index) {
                  final note = state.notes[index];
                  if (note.failureOption.isSome()) {
                    return ErrorNoteCard(note: note);
                  } else {
                    return NoteCard(note: note);
                  }
                });
          },
          loadFailure: (state) =>
              CriticalFailureDisplay(failure: state.noteFailure),
        );
      },
    );
  }
}
