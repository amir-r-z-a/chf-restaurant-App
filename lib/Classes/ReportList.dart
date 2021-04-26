import 'package:chfrestaurant/Classes/Report.dart';

class ReportList {
  List<Report> _reports;

  List<Report> get reportList => _reports;

  set reportList(List<Report> value) {
    _reports = value;
  }
}
