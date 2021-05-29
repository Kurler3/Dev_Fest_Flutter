import 'package:bloc/bloc.dart';
import 'index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static final HomeBloc _instance = HomeBloc._internal();

  factory HomeBloc() {
    return _instance;
  }

  HomeBloc._internal() : super(UnHomeState());

  bool darkMode = false;

  @override
  HomeState get initialState => UnHomeState();

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    try {
      yield UnHomeState();
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (e, stackTrace) {
      print('$e $stackTrace');
      yield state;
    }
  }
}
