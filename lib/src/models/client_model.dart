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

  ContactedClient({
    this.name,
    this.email,
    this.channel,
    this.interests,
    this.level,
  });
}

class TrialClient {
  String? name;
  String? email;
  String? platform;
  String? duration;
  String? startDate;

  TrialClient({
    this.name,
    this.email,
    this.platform,
    this.duration,
    this.startDate,
  });
}

class SubscribedClient {
  String? name;
  String? email;
  String? platform;
  String? plan;
  String? startDate;
  String? endDate;

  SubscribedClient({
    this.name,
    this.email,
    this.plan,
    this.platform,
    this.startDate,
    this.endDate,
  });
}

class DiscardedClient {
  String? name;
  String? email;
  String? origin;
  String? channel;
  String? reason;

  DiscardedClient({
    this.name,
    this.email,
    this.origin,
    this.channel,
    this.reason,
  });
}
