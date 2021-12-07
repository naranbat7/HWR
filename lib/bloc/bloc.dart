import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hwr_app/bloc/event.dart';
import 'package:hwr_app/bloc/index.dart';
import 'package:hwr_app/model/psycho.dart';
import 'package:hwr_app/services/api/index.dart';

class CommonBloc extends Bloc<CommonEvent, CommonState> {
  CommonBloc(CommonState initialState) : super(initialState);

  CommonState get initialState => CommonInitial();

  @override
  Stream<CommonState> mapEventToState(CommonEvent event) async* {
    /// [Common Request event]
    if (event is CommonRequest) {
      yield CommonLoading();
      try {
        PsychoModel data = await ApiHelper.postFile(event.file);
        yield CommonSuccessful(successMsg: "Successful", data: data);
      } catch (ex) {
        print("error: " + ex.toString());
        yield CommonFailure(error: "Алдаа гарлаа. Та дахин оролдоно уу.");
      }
    }
  }
}
