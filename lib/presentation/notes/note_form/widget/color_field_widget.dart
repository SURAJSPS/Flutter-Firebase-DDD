import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_firebase_ddd_with_bloc/domain/notes/value_objects.dart';

import '../../../../application/notes/note_form/note_form_bloc.dart';

class ColorField extends StatelessWidget {
  const ColorField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NoteFormBloc, NoteFormState>(
      buildWhen: (p, c) => p.note.color != c.note.color,
      builder: (context, state) {
        return SizedBox(
          height: 80,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            scrollDirection: Axis.horizontal,
            itemCount: NoteColor.predefinedColors.length,
            separatorBuilder: (context, index) {
              return const SizedBox(width: 12);
            },
            itemBuilder: (context, index) {
              final itemColor = NoteColor.predefinedColors[index];
              return GestureDetector(
                onTap: () {
                  context
                      .read<NoteFormBloc>()
                      .add(NoteFormEvent.colorChanged(itemColor));
                },
                child: Material(
                  color: itemColor,
                  elevation: 4,
                  shape: CircleBorder(
                    // side: BorderSide(width: 1.5),
                    side: state.note.color.value.fold(
                      (l) => BorderSide.none,
                      (color) => color == itemColor
                          ? const BorderSide(width: 1.5)
                          : BorderSide.none,
                    ),
                  ),
                  child: const SizedBox(height: 50, width: 50),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
