import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../data/models/chat/chat.dart';
import '../../data/models/fixture/fixture.dart';
import '../../data/models/user/user_local.dart';
import '../../data/providers/local/local_storage.dart';
import '../../data/repositories/fixture_chat/fixture_chat_repository.dart';
import '../../domain/chat_failure/chat_failure.dart';
import '../../routes/app_routes.dart';

class FixtureChatController extends GetxController {
  final FixtureChatRepository _fixtureChatRepository = FixtureChatRepository();
  final LocalStorage _localStorage = Get.find<LocalStorage>();

  bool _showSendButton = false;
  bool get showSendButton => _showSendButton;

  bool _showLoading = false;
  bool get showLoading => _showLoading;

  String _newMessage = '';
  String get newMessage => _newMessage;

  String _appBarTitle = '';
  String get appBarTitle => _appBarTitle;

  Fixture _fixture;

  TextEditingController _textController;
  TextEditingController get textController => _textController;

  UserLocal _userLocal;
  UserLocal get userLocal => _userLocal;

  Rx<Either<ChatFailure, List<Chat>>> chatListOrFailure =
      Rx<Either<ChatFailure, List<Chat>>>();
  Either<ChatFailure, List<Chat>> get chatOrFailure => chatListOrFailure.value;

  void loadList() async => await _load();

  @override
  void onInit() {
    _fixture = Get.arguments as Fixture;
    _textController = TextEditingController();

    setAppBarTitle();
    getUser();
    super.onInit();
  }

  void setAppBarTitle() {
    String homeTeamStr = _fixture.homeTeam['team_name'];
    String awayTeamStr = _fixture.awayTeam['team_name'];
    _appBarTitle = homeTeamStr + " vs " + awayTeamStr;
  }

  void getUser() async {
    _userLocal = await _localStorage.getUser();
  }

  @override
  void onReady() async {
    await _load();
    super.onReady();
  }

  Future<void> _load() async {
    chatListOrFailure.bindStream(
        _fixtureChatRepository.getChats(fixture_id: _fixture.fixture_id));
  }

  void onRefresh() async {
    await _load();
    // _refreshController.refreshCompleted();
  }

  void onMessageChange(String text) {
    _newMessage = text.trim();
    _showSendButton = _newMessage.length > 0;
    update(['newMessageController']);
  }

  Future<void> onMessageSave(context) async {
    FocusScope.of(context).unfocus();

    if (_newMessage.length > 0) {
      _showLoading = true;
      update(['newMessageController']);
      Either<ChatFailure, Unit> request = await _fixtureChatRepository
          .saveMessage(_fixture.fixture_id, _userLocal, _newMessage);

      request.fold((failure) {
        resetSendButton();
        return null;
      }, (_) {
        resetTextInput();
        return null;
      });
    }
  }

  void resetTextInput() {
    _showLoading = false;
    _showSendButton = false;
    _textController.text = '';
    _newMessage = '';
    update(['newMessageController']);
  }

  void resetSendButton() {
    _showLoading = false;
    _showSendButton = true;
    update(['newMessageController']);
  }

  void onUserPressed(String userEmail) {
    Get.toNamed(AppRoutes.USER_PUBLIC_PROFILE,
        arguments: {'userEmail': userEmail});
  }
}
