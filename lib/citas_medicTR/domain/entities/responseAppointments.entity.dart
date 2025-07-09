class ResponseAppointments {
  List<ResponseAppointments> data;
  Meta meta;

  ResponseAppointments({
    required this.data,
    required this.meta,
  });
}

class Meta {
  int page;
  int limitPerPage;
  int totalPages;
  int totalItems;

  Meta({
    required this.page,
    required this.limitPerPage,
    required this.totalPages,
    required this.totalItems,
  });
}
