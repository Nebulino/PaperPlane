import 'package:paperplane/src/helpers/command/command.dart';

extension CommandExtension on Command {
// TODO: implement CommandExtension

  Command get _instance => instance;

  dynamic run() {
    return _instance.function();
  }
}
