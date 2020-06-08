import 'dart:convert';

UserModel userFromJson(String str) => UserModel.fromJson(json.decode(str));

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    UserModel({
        this.accessToken,
        this.tokenType,
        this.expiresIn,
        this.refreshToken,
        this.userName,
        this.isAuthenticated,
        this.accountName,
        this.organizationId,
        this.centerId,
        this.zoneId,
        this.userId,
        this.timeZoneId,
        this.hasZenotiCreds,
        this.socialFaceBookUserId,
        this.socialGoogleUserId,
        this.cultureId,
        this.currencyId,
        this.centerName,
        this.roleName,
        this.appId,
        this.loginUserType,
        this.refresh,
        this.issued,
        this.expires,
    });

    String accessToken;
    String tokenType;
    int expiresIn;
    String refreshToken;
    String userName;
    String isAuthenticated;
    String accountName;
    String organizationId;
    String centerId;
    String zoneId;
    String userId;
    String timeZoneId;
    String hasZenotiCreds;
    String socialFaceBookUserId;
    String socialGoogleUserId;
    String cultureId;
    String currencyId;
    String centerName;
    String roleName;
    String appId;
    String loginUserType;
    String refresh;
    String issued;
    String expires;

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        accessToken: json["access_token"],
        tokenType: json["token_type"],
        expiresIn: json["expires_in"],
        refreshToken: json["refresh_token"],
        userName: json["UserName"],
        isAuthenticated: json["IsAuthenticated"],
        accountName: json["AccountName"],
        organizationId: json["OrganizationId"],
        centerId: json["CenterId"],
        zoneId: json["ZoneId"],
        userId: json["UserId"],
        timeZoneId: json["TimeZoneId"],
        hasZenotiCreds: json["hasZenotiCreds"],
        socialFaceBookUserId: json["SocialFaceBookUserId"],
        socialGoogleUserId: json["SocialGoogleUserId"],
        cultureId: json["CultureId"],
        currencyId: json["CurrencyId"],
        centerName: json["CenterName"],
        roleName: json["RoleName"],
        appId: json["AppId"],
        loginUserType: json["LoginUserType"],
        refresh: json[".refresh"],
        issued: json[".issued"],
        expires: json[".expires"],
    );

    Map<String, dynamic> toJson() => {
        "access_token": accessToken,
        "token_type": tokenType,
        "expires_in": expiresIn,
        "refresh_token": refreshToken,
        "UserName": userName,
        "IsAuthenticated": isAuthenticated,
        "AccountName": accountName,
        "OrganizationId": organizationId,
        "CenterId": centerId,
        "ZoneId": zoneId,
        "UserId": userId,
        "TimeZoneId": timeZoneId,
        "hasZenotiCreds": hasZenotiCreds,
        "SocialFaceBookUserId": socialFaceBookUserId,
        "SocialGoogleUserId": socialGoogleUserId,
        "CultureId": cultureId,
        "CurrencyId": currencyId,
        "CenterName": centerName,
        "RoleName": roleName,
        "AppId": appId,
        "LoginUserType": loginUserType,
        ".refresh": refresh,
        ".issued": issued,
        ".expires": expires,
    };
}
