import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:formz/formz.dart';

import '../../../bloc/blocs.dart';
import '../../../widgets/widget.dart';

class ButtonSubmitted extends StatelessWidget {
  const ButtonSubmitted({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ArticlePostCubit, ArticlePostState>(
      buildWhen: (previous, current) => previous.status != current.status,
      listener: (_, state) {
        if (state.status.isSubmissionSuccess || state.status.isSubmissionFailure)
          Fluttertoast.showToast(msg: state.message, toastLength: Toast.LENGTH_SHORT);
      },
      builder: (context, state) {
        return ButtonCustom(
          onPressed: () {
            if (state.status.isValidated) context.read<ArticlePostCubit>().onSubmitted();
          },
          child: state.status.isSubmissionInProgress
              ? ButtonLoader()
              : Text('Save Data'),
        );
      },
    );
  }
}