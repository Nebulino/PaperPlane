import 'package:paperplane/types.dart';

/// It helps creating a custom command.
class Command {
  static Command _instance;

  // TODO: implement Command

  String name;
  Function _callback;
  String _description;
  String _usage;
  bool _only_admins;

  List<User> _permitted_users;

  Command._(this.name, this._callback, this._description, this._usage,
      this._only_admins, this._permitted_users);

  factory Command.create(String name,
      {Function callback,
      String description,
      String usage,
      bool only_admins,
      List<User> permitted_users}) {
    return Command._(
        name, callback, description, usage, only_admins, permitted_users);
  }

  Command get instance => _instance;

  Function get function => _callback;

  String get description => _description;

  String get usage => _usage;

  bool get only_admins => _only_admins;

  List<User> get permitted_users => _permitted_users;

  void permitUser(User user) => _permitted_users.add(user);

  bool removeUser(User user) {
    if (_permitted_users.contains(user)) {
      _permitted_users.remove(user);
      return true;
    }
    return false;
  }
}
