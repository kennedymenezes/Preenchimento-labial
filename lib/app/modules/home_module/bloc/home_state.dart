import 'package:labial/app/domain/app/model/patiente_model.dart';

class HomeState {
  HomeState init() {
    return HomeState();
  }

  HomeState clone() {
    return HomeState();
  }
}
class HomeStateLoading extends HomeState{}
class HomeStateSuccess extends HomeState{

  final List<PatienteModel> data;

  HomeStateSuccess(this.data);
}