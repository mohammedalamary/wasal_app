enum StatusRequest{
  none, // initial value
  loading,
  success,
  failure, // هي لا توجد بيانات no data
  serverFailure,
  serverException,
  offlineFailure
}