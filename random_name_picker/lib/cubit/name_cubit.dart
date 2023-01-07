import 'package:bloc/bloc.dart';
import 'package:random_name_picker/homepage.dart';

class NamesCubit extends Cubit<String?> {
  NamesCubit() : super(null);

  void pickRandomName() => emit(names.getRandomElement());
}
