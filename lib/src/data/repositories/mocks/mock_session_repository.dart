//mock_session_repository.dart
import '../session_repository.dart';
import '../../models/user_session.dart';

/// Mock-Repository für User Sessions
/// Typ-sicher: id = int, userId = String (UUID)
class MockSessionRepository implements SessionRepository {
  final List<UserSession> _sessions = [];

  @override
  Future<void> addSession(UserSession session) async {
    _sessions.add(session);
  }

  @override
  Future<UserSession?> getSessionById(int id) async {
    // Loop statt firstWhere(..., orElse: () => null)
    for (var s in _sessions) {
      if (s.id == id) return s;
    }
    return null;
  }

  @override
  Future<List<UserSession>> getSessionsForUser(String userId) async {
    return _sessions.where((s) => s.userId == userId).toList();
  }

  @override
  Future<void> updateSession(UserSession session) async {
    _sessions.removeWhere((s) => s.id == session.id);
    _sessions.add(session);
  }

  @override
  Future<void> deleteSession(int id) async {
    _sessions.removeWhere((s) => s.id == id);
  }
}
