class Date {
  String _year;
  String _month;
  String _day;
  String _hour;
  String _minute;
  String _second;

  Date(this._year, this._month, this._day, this._hour, this._minute,
      this._second);

  String dateFormatter() {
    return year +
        '/' +
        day +
        '/' +
        month +
        ' , ' +
        hour +
        ':' +
        minute +
        ':' +
        second;
  }

  String get year => _year;

  set year(String value) {
    _year = value;
  }

  String get month => _month;

  String get second => _second;

  set second(String value) {
    _second = value;
  }

  String get minute => _minute;

  set minute(String value) {
    _minute = value;
  }

  String get hour => _hour;

  set hour(String value) {
    _hour = value;
  }

  String get day => _day;

  set day(String value) {
    _day = value;
  }

  set month(String value) {
    _month = value;
  }
}
