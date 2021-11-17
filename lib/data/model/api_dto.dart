class ApiDTO<T> {
  ApiDTO({
    this.response,
    this.error,
  });

  final T? response;
  final String? error;
}