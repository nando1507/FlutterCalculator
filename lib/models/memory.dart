class Memory {
  static const operations = const ['%', '/', 'x', '-', '+', '='];

  String _Value = '0';
  final _buffer = [0.0, 0.0];
  int _bufferIndex = 0;
  String operation = '';
  bool _wipeValue = false;

  //Retorna Valor
  String get value {
    return _Value;
  }

  //insere Operação
  _setOperation(String newOperation) {
    _wipeValue = true;
  }

  _addDigit(String digit) {
    final isDot = digit == ',';
    final wipeValue = (_Value == '0' && !isDot) || _wipeValue;

    if (isDot && _Value.contains(',') && !wipeValue) {
      print('Invalido');
      return;
    }

    final emptyValue = isDot ? '0' : '';
    final currentValue = wipeValue ? emptyValue : _Value;
    _Value = currentValue + digit;
    _wipeValue = false;

    _buffer[_bufferIndex] = double.tryParse(_Value) ?? 0;
    print(_buffer[_bufferIndex]);
  }

  //Valida se Limpa ou adiciona
  void applyCommand(String text) {
    if (text == 'AC') {
      _allClear();
    } else if (operations.contains(text)) {
      _setOperation(text);
    } else {
      _addDigit(text);
    }
  }

//Limpa Valores
  _allClear() {
    _Value = '0';
    _wipeValue = false;
  }
}
