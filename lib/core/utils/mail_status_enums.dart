enum MailStatusEnums {
  pending(status: 'PENDING'),
  error(status: 'ERROR'),
  processing(status: 'PROCESSING'),
  success(status: 'SUCCESS'),
  empty(status: '');

  const MailStatusEnums({
    required this.status,
  });

  final String status;

  bool get isPending => this == MailStatusEnums.pending;
  bool get isError => this == MailStatusEnums.error;
  bool get isProcessing => this == MailStatusEnums.processing;
  bool get isSuccess => this == MailStatusEnums.success;
  bool get isEmpty => this == MailStatusEnums.empty;
}
