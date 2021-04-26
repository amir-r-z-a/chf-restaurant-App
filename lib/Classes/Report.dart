class Report {
  String _sellReport;
  int _orders;
  double _sumSell;
  double _onlineSell;
  double _cashSell;

  String get sellReport => _sellReport;

  set sellReport(String value) {
    _sellReport = value;
  }

  int get orders => _orders;

  double get cashSell => _cashSell;

  set cashSell(double value) {
    _cashSell = value;
  }

  double get onlineSell => _onlineSell;

  set onlineSell(double value) {
    _onlineSell = value;
  }

  double get sumSell => _sumSell;

  set sumSell(double value) {
    _sumSell = value;
  }

  set orders(int value) {
    _orders = value;
  }
}
