import '../../domain/domain.dart';
import '../data.dart';

class ChatRemoteRepositoryImp implements ChatRepository {
  final RemoteDataSources _remoteDataSource;

  ChatRemoteRepositoryImp(this._remoteDataSource);

  @override
  Future<List<ChatMessage>> fetchChatMessage() async {
    try {
      final response = await _remoteDataSource.fetchChatMessage();
      return ChatMapper.romteToDomainList(response);
    } catch (e) {
      throw Exception('Failed to load chat message : $e');
    }
  }
}


class ChatLocalRepositoryImp implements ChatLocalRepository{
  final LocalDataSource _localDataSource;

  ChatLocalRepositoryImp(this._localDataSource);

  @override
  Future<void> addMessage(List<ChatMessage> messages) async {
    try {
      await _localDataSource.addMessages(messages);
    } catch (e) {
      throw Exception('Failed to add local chat message : $e');
    }
  }

  @override
  Future<List<ChatMessage>> getAllMessages() async {
    try {
      final response = await _localDataSource.getAllMessages();
      return ChatMapper.localToDomainList(response);
    } catch (e) {
      throw Exception('Failed to getAll local chat message : $e');
    }
  }
}