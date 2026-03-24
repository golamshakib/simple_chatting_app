class ConversationResponse {
  final bool? success;
  final String? message;
  final Meta? meta;
  final List<ConversationResult>? result;

  ConversationResponse({
    this.success,
    this.message,
    this.meta,
    this.result,
  });

  factory ConversationResponse.fromJson(Map<String, dynamic> json) {
    return ConversationResponse(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      meta: json['meta'] == null ? null : Meta.fromJson(json['meta']),
      result: (json['result'] as List?)
          ?.map((e) => ConversationResult.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'meta': meta?.toJson(),
      'result': result?.map((e) => e.toJson()).toList(),
    };
  }
}

class Meta {
  final int? page;
  final int? limit;
  final int? total;

  Meta({this.page, this.limit, this.total});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      page: (json['page'] as num?)?.toInt(),
      limit: (json['limit'] as num?)?.toInt(),
      total: (json['total'] as num?)?.toInt(),
    );
  }

  Map<String, dynamic> toJson() => {
    'page': page,
    'limit': limit,
    'total': total,
  };
}

class ConversationResult {
  final String? conversationId;
  final String? type;
  final Participant? participants;
  final String? lastMessage;
  final String? lastMessageTime; // keep String since your formatter expects String
  final int? unseen;
  final String? messageStatus;
  final String? lastMessageUserId;

  ConversationResult({
    this.conversationId,
    this.type,
    this.participants,
    this.lastMessage,
    this.lastMessageTime,
    this.unseen,
    this.messageStatus,
    this.lastMessageUserId,
  });

  factory ConversationResult.fromJson(Map<String, dynamic> json) {
    return ConversationResult(
      conversationId: json['conversationId'] as String?,
      type: json['type'] as String?,
      participants: json['participants'] == null
          ? null
          : Participant.fromJson(json['participants']),
      lastMessage: json['lastMessage'] as String?,
      lastMessageTime: json['lastMessageTime'] as String?,
      unseen: (json['unseen'] as num?)?.toInt(),
      messageStatus: json['messageStatus'] as String?,
      lastMessageUserId: json['lastMessageUserId'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'conversationId': conversationId,
      'type': type,
      'participants': participants?.toJson(),
      'lastMessage': lastMessage,
      'lastMessageTime': lastMessageTime,
      'unseen': unseen,
      'messageStatus': messageStatus,
      'lastMessageUserId': lastMessageUserId,
    };
  }
}


class Participant {
  final String? id;
  final String? username;
  final String? image;
  final String? isOnline; // API sends "1"/"0" as String
  final String? lastActivateAt;
  final bool? isLike;

  Participant({
    this.id,
    this.username,
    this.image,
    this.isOnline,
    this.lastActivateAt,
    this.isLike,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'] as String?,
      username: json['username'] as String?,
      image: json['image'] as String?,
      isOnline: json['isOnline'] as String?,
      lastActivateAt: json['lastActivateAt'] as String?,
      isLike: json['isLike'] as bool?,
    );
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'username': username,
    'image': image,
    'isOnline': isOnline,
    'lastActivateAt': lastActivateAt,
    'isLike': isLike,
  };

  /// Convenient getter (so UI can do: participants?.isOnlineBool)
  bool get isOnlineBool => isOnline == "1";
}
