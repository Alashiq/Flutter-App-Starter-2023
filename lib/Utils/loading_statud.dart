enum LoadingStatus {
  NOT_STARTED("البداية", 0),
  IN_PROGRESS("قيد التحميل", 1),
  DONE("تم التحميل", 200),
  EMPTY("القائمة فارغة", 204),
  BAD_REQUEST("حدث خطأ ما", 400),
  NOT_AUTH("القائمة فارغة", 401),
  NO_INTERNET("لا يوجد إتصال بالإنترنت", 404);

  const LoadingStatus(this.arabic, this.value);
  final String arabic;
  final int value;
}
