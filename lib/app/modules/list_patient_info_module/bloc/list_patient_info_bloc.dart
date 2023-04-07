import 'package:bloc/bloc.dart';

import 'list_patient_info_event.dart';
import 'list_patient_info_state.dart';

class ListPatientInfoBloc extends Bloc<ListPatientInfoEvent, ListPatientInfoState> {
  ListPatientInfoBloc() : super(ListPatientInfoState().init()) {
    on<InitEvent>(_init);
  }

  void _init(InitEvent event, Emitter<ListPatientInfoState> emit) async {
    emit(state.clone());
  }
}
