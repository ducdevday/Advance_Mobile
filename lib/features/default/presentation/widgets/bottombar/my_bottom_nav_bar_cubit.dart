import 'package:flutter_bloc/flutter_bloc.dart';

class MyBottomNavBarCubit extends Cubit<int> {
  MyBottomNavBarCubit() : super(0);

  void selectPage(int page) {
    emit(page);
  }
}
