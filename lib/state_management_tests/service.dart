class Service {
  Future<String> loadData() async {
    await Future.delayed(const Duration(seconds: 3));

    return "IFAL 2022";
  }
}
