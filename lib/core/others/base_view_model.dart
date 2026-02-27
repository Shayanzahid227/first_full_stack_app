import 'package:flutter/foundation.dart';
import 'package:girl_clan/core/enums/view_state_model.dart';

class BaseViewModel extends ChangeNotifier {
  ViewState _state = ViewState.idle;
  bool _isDisposed = false;

  ViewState get state => _state;

  void setState(ViewState state) {
    if (_isDisposed) return; // 🛑 safety check
    _state = state;
    notifyListeners();
  }

  @override
  void dispose() {
    _isDisposed = true;
    super.dispose();
  }
}