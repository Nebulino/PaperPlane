/// This helps managing [chat_id] field in [API].
///
class ChatID {
  dynamic _identifier;

  ChatID._(this._identifier);

  /// It creates a ChatID using a integer chat_id.
  ChatID.fromID(int id) : this._(id);

  /// It creates a ChatID using a name of the Target Channel or Group.
  ChatID.fromName(String name) : this._(name);

  @override
  String toString() => _identifier.toString();
}
