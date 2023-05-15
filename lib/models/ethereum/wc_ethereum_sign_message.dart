enum WCSignType {
  MESSAGE,
  PERSONAL_MESSAGE,
  TYPED_MESSAGE_V1,
  TYPED_MESSAGE_V3,
  TYPED_MESSAGE_V4
}

class WCEthereumSignMessage {
  final List<String> raw;
  final WCSignType type;
  WCEthereumSignMessage({
    required this.raw,
    required this.type,
  });

  String? get data {
    switch (type) {
      case WCSignType.MESSAGE:
        return raw[1];
      case WCSignType.TYPED_MESSAGE_V1:
      case WCSignType.TYPED_MESSAGE_V3:
      case WCSignType.TYPED_MESSAGE_V4:
        return raw[1];
      case WCSignType.PERSONAL_MESSAGE:
        return raw[0];
      default:
        return null;
    }
  }

  int? get version {
    switch (type) {
      case WCSignType.TYPED_MESSAGE_V1:
        return 1;
      case WCSignType.TYPED_MESSAGE_V3:
        return 3;
      case WCSignType.TYPED_MESSAGE_V4:
        return 4;
      default:
        return null;
    }
  }
}
