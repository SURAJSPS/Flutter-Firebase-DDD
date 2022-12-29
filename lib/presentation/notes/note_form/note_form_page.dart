import 'package:another_flushbar/flushbar_helper.dart';
import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd_with_bloc/injection.dart';
import 'package:flutter_firebase_ddd_with_bloc/presentation/notes/note_form/misc/todo_item_presentation_classes.dart';
import 'package:provider/provider.dart';
import '../../../application/notes/note_form/note_form_bloc.dart';
import '../../../domain/notes/note.dart';
import '../../routes/router.gr.dart';
import 'widget/add_todo_tile_widget.dart';
import 'widget/body_field_widget.dart';
import 'widget/color_field_widget.dart';
import 'widget/todo_list_widget.dart';

class NoteFormPage extends StatelessWidget {
  const NoteFormPage({Key? key, required this.editedNote}) : super(key: key);
  final Note? editedNote;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<NoteFormBloc>()
        ..add(NoteFormEvent.initialize(optionOf(editedNote))),
      child: BlocConsumer<NoteFormBloc, NoteFormState>(
        listenWhen: (p, c) => p.isSaving != c.isSaving,
        listener: (context, state) {
          state.saveFailureOrSuccessOption.fold(() {}, (either) {
            either.fold(
              (failure) => FlushbarHelper.createError(
                message: failure.map(
                  unexpected: (_) =>
                      'Unexpected error occurred, please contact support.',
                  insufficientPermission: (_) => 'Insufficient permissions ❌',
                  unableToUpdate: (_) =>
                      "Couldn't update the note. Was it deleted from another device?",
                ),
              ).show(context),
              (_) => context.router.popUntil(
                (route) => route.settings.name == NotesOverviewRoute.name,
              ),
            );
          });
        },
        buildWhen: (p, c) => p.isSaving != c.isSaving,
        builder: (context, state) {
          return Stack(
            children: [
              const NoteFormPageScaffold(),
              SavingInProgressOverlay(isSaving: state.isSaving),
            ],
          );
        },
      ),
    );
  }
}

class SavingInProgressOverlay extends StatelessWidget {
  const SavingInProgressOverlay({Key? key, required this.isSaving})
      : super(key: key);
  final bool isSaving;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return IgnorePointer(
      ignoring: !isSaving,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        color: isSaving ? Colors.black.withOpacity(.8) : Colors.transparent,
        height: size.height,
        width: size.width,
        child: Visibility(
          visible: isSaving,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircularProgressIndicator(),
              const SizedBox(height: 8),
              Text(
                "Saving",
                style: Theme.of(context)
                    .textTheme
                    .bodyText2
                    ?.copyWith(color: Colors.white, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NoteFormPageScaffold extends StatelessWidget {
  const NoteFormPageScaffold({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<NoteFormBloc, NoteFormState>(
          // State Note ReBuild
          buildWhen: (p, c) => p.isEditing != c.isEditing,
          builder: (context, state) {
            return Text(state.isEditing ? "Edit a note" : "Create a note");
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: () {
              context.read<NoteFormBloc>().add(const NoteFormEvent.saved());
            },
          ),
        ],
      ),
      body: BlocBuilder<NoteFormBloc, NoteFormState>(
        buildWhen: (p, c) => p.showErrorMessages != c.showErrorMessages,
        builder: (context, state) {
          return ChangeNotifierProvider(
            create: (_) => FormTodos(),
            child: Form(
              autovalidateMode: state.showErrorMessages,
              child: SingleChildScrollView(
                child: Column(
                  children: const [
                    BodyField(),
                    ColorField(),
                    AddTodoTile(),
                    TodoList(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
