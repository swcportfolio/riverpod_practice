import '../../domain.dart';
import '../base.dart';

/// 회의 목록을 가져오는 유스케이스
class FetchMeetingRoomUseCase implements UseCase<List<MeetingRoom>, void> {
  final MeetingRepository _meetingRepository;

  FetchMeetingRoomUseCase(this._meetingRepository);

  @override
  Future<List<MeetingRoom>> execute() {
    return _meetingRepository.fetchMeetingRoom();
  }
}