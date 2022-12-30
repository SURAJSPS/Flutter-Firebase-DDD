import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd_with_bloc/application/notes/note_actor/note_actor_bloc.dart';
import 'package:flutter_firebase_ddd_with_bloc/application/notes/note_watcher/note_watcher_bloc.dart';
import '../../../application/auth/auth_bloc.dart';
import '../../../injection.dart';
import '../../routes/router.gr.dart';
import 'widget/notes_overview_body_widget.dart';
import 'widget/uncompleted_switch.dart';

class NotesOverviewPage extends StatelessWidget {
  const NotesOverviewPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<NoteWatcherBloc>(
            create: (context) => getIt<NoteWatcherBloc>()
              ..add(const NoteWatcherEvent.watchAllStarted()),
          ),
          BlocProvider<NoteActorBloc>(
            create: (context) => getIt<NoteActorBloc>(),
          ),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<AuthBloc, AuthState>(
              listener: (context, state) => state.maybeMap(
                unauthenticated: (_) =>
                    context.router.replace(const SignInRoute()),
                orElse: () {},
              ),
            ),
            BlocListener<NoteActorBloc, NoteActorState>(
              listener: (context, state) => state.maybeMap(
                orElse: () {},
                deleteFailure: (state) => FlushbarHelper.createError(
                  message: state.noteFailure.map(
                    unexpected: (_) =>
                        'Unexpected error occurred while deleting, please contact support.',
                    insufficientPermission: (_) => 'Insufficient permissions ❌',
                    unableToUpdate: (_) => 'Impossible error',
                    // unableToDelete: (_) => "Unable to delete",
                  ),
                ).show(context),
              ),
            ),
          ],
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Notes'),
              leading: IconButton(
                icon: const Icon(Icons.exit_to_app),
                onPressed: () {
                  context.read<AuthBloc>().add(const AuthEvent.signedOut());
                  // context.router.replace(const SignInRoute());
                },
              ),
              actions: const [
                UncompletedSwitch(),
              ],
            ),
            body: const NotesOverViewBody(),
            floatingActionButton: FloatingActionButton(
              onPressed: () {
                context.router.push(NoteFormRoute(editedNote: null));
              },
              child: const Icon(Icons.add),
            ),
          ),
        ));
  }
}
