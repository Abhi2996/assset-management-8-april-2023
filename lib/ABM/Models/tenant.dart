//Tenant means Asset or prodoct
class Tenant {
  final int? id;
  final String assetname;
  final String asset_type;
  final String purchaedate;
  final String QRcode;

  Tenant(
      {this.id,
      required this.assetname,
      required this.asset_type,
      required this.purchaedate,
      required this.QRcode});

  //convert to map
  Map<String, dynamic> toMap() => {
        'id': id,
        'assetname': assetname,
        'asset_type': asset_type,
        'purchaedate': purchaedate,
        'QRcode': QRcode
      };
//convert Map to Tenant
  factory Tenant.toFm(Map<String, dynamic> map) => Tenant(
        id: map["id"],
        assetname: map["assetname"],
        asset_type: map["asset_type"],
        purchaedate: map["purchaedate"],
        QRcode: map["QRcode"],
      );
}
