class AuthRequest {
  String? grantType;
  String? clientId;
  String? clientSecret;

  AuthRequest({
    this.grantType ='client_credentials'
    , this.clientId
    , this.clientSecret
  });

  AuthRequest.fromJson(Map<String, dynamic> json) {
    grantType = json['grant_type'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['grant_type'] = this.grantType;
    data['client_id'] = this.clientId;
    data['client_secret'] = this.clientSecret;
    return data;
  }
}
