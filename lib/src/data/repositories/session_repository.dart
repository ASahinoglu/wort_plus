//session_repository.dart
import '../models/user_session.dart';

/// Repository für User-Sessions (Lern-Sitzungen).
abstract class SessionRepository {
  Future<void> addSession(UserSession session);
  Future<UserSession?> getSessionById(int id);
  Future<List<UserSession>> getSessionsForUser(String userId);
  Future<void> updateSession(UserSession session);
  Future<void> deleteSession(int id);
}
