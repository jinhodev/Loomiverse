import 'dart:async';
import 'package:flutter/material.dart';

class TimerLogic extends ChangeNotifier {
  int _seconds = 0;
  Timer? _timer;
  bool _isTimerRunning = false; // 타이머 실행 여부 추적

  String get time => _formatTime(_seconds);
  bool get isTimerRunning => _isTimerRunning; // 현재 타이머 실행 상태를 가져오는 getter
  int get remainingSeconds => _seconds; // 남은 시간 가져오기

  void startTimer() {
    if (_seconds <= 0) return; // 시간이 0이거나 음수일 때는 시작하지 않음
    stopTimer(); // 기존 타이머 중지 후 새 타이머 시작
    _isTimerRunning = true; // 타이머 실행 상태 업데이트
    notifyListeners(); // 상태 변경 알림

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_seconds > 0) {
        _seconds--;
        notifyListeners();
      } else {
        stopTimer(); // 시간이 0이 되면 타이머 중지
      }
    });
  }

  void stopTimer() {
    _timer?.cancel();
    _timer = null; // 타이머 상태 초기화
    _isTimerRunning = false; // 타이머 실행 상태 업데이트
    notifyListeners(); // 상태 변경 알림
  }

  void resetTimer() {
    stopTimer(); // 타이머 중지
    _seconds = 0; // 초 초기화
    notifyListeners(); // UI를 업데이트하기 위해 notifyListeners() 호출
  }

  void addTime(int seconds) {
    if (_seconds + seconds <= 3600) {
      // 최대 60분(3600초) 제한
      _seconds += seconds;
    } else {
      _seconds = 3600; // 60분을 초과하면 최대값으로 설정
    }
    notifyListeners();
  }

  void subtractTime(int seconds) {
    if (_seconds > seconds) {
      _seconds -= seconds;
    } else {
      _seconds = 0; // 음수 방지
    }
    notifyListeners();
  }

  String _formatTime(int seconds) {
    final int minutes = seconds ~/ 60;
    final int secs = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';
  }

  @override
  void dispose() {
    stopTimer(); // 페이지가 닫힐 때 타이머 중지
    super.dispose();
  }
}
