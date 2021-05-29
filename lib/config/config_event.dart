import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'index.dart';
import 'package:dev_fest/utils/devfest.dart';

@immutable
abstract class ConfigEvent extends Equatable {
  @override
  List<dynamic> get props => [];

  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});
}

class LoadConfigEvent extends ConfigEvent {
  @override
  String toString() => 'LoadConfigEvent';

  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return InConfigState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorConfigState(_?.toString());
    }
  }
}

class DarkModeEvent extends ConfigEvent {
  final bool darkOn;

  DarkModeEvent(this.darkOn);

  @override
  String toString() => 'DarkModeEvent';

  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async {
    try {
      // Make changes to the bloc's variable and update the prefs
      bloc.darkMode = darkOn;
      DevFest.prefs.setBool(DevFest.DARK_MODE_PREF, darkOn);
      return InConfigState();
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      return ErrorConfigState(_?.toString());
    }
  }
}
