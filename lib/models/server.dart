class Server {
  late String serverId;
  late String serverName;
  late int serverPort;
  late String serverVersion;
  late String provider;
  late int maxRam;
  late bool isOnline;

  Server({
    required this.serverId,
    required this.serverName,
    required this.serverPort,
    required this.serverVersion,
    required this.provider,
    required this.maxRam,
  });

  Server.fromJson(Map<String, dynamic> json) {
    serverId = json['serverId'];
    serverName = json['serverName'];
    serverPort = json['serverPort'];
    serverVersion = json['serverVersion'];
    provider = json['provider'];
    maxRam = json['maxRam'];
    isOnline = json['isOnline'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['serverId'] = this.serverId;
    data['serverName'] = this.serverName;
    data['serverPort'] = this.serverPort;
    data['serverVersion'] = this.serverVersion;
    data['provider'] = this.provider;
    data['maxRam'] = this.maxRam;
    return data;
  }
}
