import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'updating_text_state.dart';

class UpdatingTextCubit extends Cubit<UpdatingTextState> {
  UpdatingTextCubit()
      : super(UpdatingTextState(textValue: "Default BLoC text...."));

  void updateText(String newValue) => emit(UpdatingTextState(textValue: newValue));

}
