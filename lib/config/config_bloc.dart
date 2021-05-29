import 'package:bloc/bloc.dart';
import 'index.dart';

class ConfigBloc extends Bloc<ConfigEvent, ConfigState> {
  static final ConfigBloc _instance = ConfigBloc._internal();

  factory ConfigBloc() {
    return _instance;
  }

  ConfigBloc._internal() : super(UnConfigState());

  bool darkMode = false;

  @override
  ConfigState get initialState => UnConfigState();

  @override
  Stream<ConfigState> mapEventToState(ConfigEvent event) async* {
    try {
      yield UnConfigState();
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (e, stackTrace) {
      print('$e $stackTrace');
      yield state;
    }
  }
}
