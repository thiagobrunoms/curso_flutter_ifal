import 'dart:async';

class SignInSignUpController {
  StreamController<String> nameController = StreamController.broadcast();
  StreamController<String> emailController = StreamController.broadcast();
  StreamController<String> passwordController = StreamController.broadcast();

  Stream<String> get nameStream =>
      nameController.stream.transform(nameTransformer);

  Sink<String> get nameSink => nameController.sink;

  StreamTransformer<String, String> nameTransformer =
      StreamTransformer.fromHandlers(handleData: (name, sink) {
    if (name.length < 5) {
      sink.addError('Nome deve ter pelo menos 5 caracteres!');
    } else {
      sink.add(name);
    }
  });

  void dispose() {
    nameController.close();
    emailController.close();
    passwordController.close();
  }
}
