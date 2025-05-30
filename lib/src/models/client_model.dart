class NewClient {
  String? name;
  String? email;
  String? origin;
  String? campaign;
  String? category;

  NewClient({this.name, this.email, this.origin, this.campaign, this.category});
}

class ContactedClient {
  String? name;
  String? email;
  String? channel;
  String? interests;
  String? level;
  String? lastContact;
  String? origin;

  ContactedClient({
    this.name,
    this.email,
    this.channel,
    this.interests,
    this.level,
    this.lastContact,
    this.origin,
  });
}

class TrialClient {
  String? name;
  String? email;
  String? platform;
  String? duration;
  String? startDate;
  String? lastContact;
  String? origin;

  TrialClient({
    this.name,
    this.email,
    this.platform,
    this.duration,
    this.startDate,
    this.lastContact,
    this.origin,
  });
}

class SubscribedClient {
  String? name;
  String? email;
  String? platform;
  String? plan;
  String? startDate;
  String? endDate;
  String? lastContact;
  String? origin;

  SubscribedClient({
    this.name,
    this.email,
    this.plan,
    this.platform,
    this.startDate,
    this.endDate,
    this.lastContact,
    this.origin,
  });
}

class DiscardedClient {
  String? name;
  String? email;
  String? origin;
  String? channel;
  String? reason;
  String? lastContact;

  DiscardedClient({
    this.name,
    this.email,
    this.origin,
    this.channel,
    this.reason,
    this.lastContact,
  });
}

class EventClient {
  String? title;
  String? date;
  String? description;
  String? link;
  String? duration;

  EventClient({
    this.title,
    this.date,
    this.description,
    this.link,
    this.duration,
  });
}

class NoteClient {
  String? content;
  String? date;
  NoteClient({this.content, this.date});
}

class MessageClient {
  String? name;
  String? email;
  String? subject;
  String? content;
  String? date;
  MessageClient({this.name, this.email, this.subject, this.content, this.date});
}
