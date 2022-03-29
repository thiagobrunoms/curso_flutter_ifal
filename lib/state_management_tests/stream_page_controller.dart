import 'dart:async';

class StreamPageController {
  StreamController<bool> _checkboxController = StreamController<bool>();
  StreamController<String> _nameController = StreamController<String>();

  Stream<bool> get checkboxStream => _checkboxController.stream;
  Sink<bool> get checkboxSink => _checkboxController.sink;

  Stream<String> get nameStream => _nameController.stream;
  Sink<String> get nameSink => _nameController.sink;
}
