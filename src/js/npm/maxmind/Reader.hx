package js.npm.maxmind;

typedef Names = {
  ?de : String,
  en : String,
  ?es : String,
  ?fr : String,
  ?ja : String,
  // ?"pt-BR" : String,
  ?ru : String,
  // ?"zh-CN" : String,
}

typedef CityRecord = {
  ?confidence : Float,
  geoname_id : Int,
  names : Names,
}

@:enum abstract ContinentCode(String) {
  var Africa = "AF";
  var Antarctica = "AN";
  var Asia = "AS";
  var Europe = "EU";
  var NorthAmerica = "NA";
  var Oceania = "OC";
  var SouthAmerica = "SA";
}

typedef ContinentRecord = {
  code : ContinentCode,
  geoname_id : Int,
  names : Names,
}

typedef RegisteredCountryRecord = {
  geoname_id : Int,
  ?is_in_european_union : Bool,
  iso_code : String,
  names : Names,
}

typedef CountryRecord = {
  > RegisteredCountryRecord,
  ?confidence : Float,
}

typedef LocationRecord = {
  accuracy_radius : Int,
  ?average_income : Int,
  latitude : Int,
  longitude : Int,
  ?metro_code : Int,
  ?population_density : Int,
  ?time_zone : String,
}

typedef PostalRecord = {
  code : String,
  ?confidence : Float,
}

typedef RepresentedCountryRecord = {
  > RegisteredCountryRecord,
  type : String,
}

typedef SubdivisionsRecord = {
  ?confidence : Float,
  geoname_id : Int,
  iso_code : String,
  names : Names,
}

@:enum abstract UserType(String) {
  var Business = "business";
  var Cafe = "cafe";
  var Cellular = "cellular";
  var College = "college";
  var ContentDeliveryNetwork = "content_delivery_network";
  var Dialup = "dialup";
  var Government = "government";
  var Hosting = "hosting";
  var Library = "library";
  var Military = "military";
  var Residential = "residential";
  var Router = "router";
  var School = "school";
  var SearchEngineSpider = "search_engine_spider";
  var Traveler = "traveler";
}

typedef TraitsRecord = {
  ?autonomous_system_number : Int,
  ?autonomous_system_organization : String,
  ?domain : String,
  ?ip_address : String,
  ?is_anonymous : Bool,
  ?is_anonymous_proxy : Bool,
  ?is_anonymous_vpn : Bool,
  ?is_hosting_provider : Bool,
  ?is_public_proxy : Bool,
  ?is_satellite_provider : Bool,
  ?is_tor_exit_node : Bool,
  ?isp : String,
  ?organization : String,
  ?user_type: UserType,
}

typedef Response = {}

typedef CountryResponse = {
  > Response,
  ?continent : ContinentRecord,
  ?country : CountryRecord,
  ?registered_country : RegisteredCountryRecord,
  ?represented_country : RepresentedCountryRecord,
  ?traits : TraitsRecord,
}

typedef CityResponse = {
  > CountryResponse,
  ?city : CityRecord,
  ?location : LocationRecord,
  ?postal : PostalRecord,
  ?subdivisions : Array<SubdivisionsRecord>,
}

typedef AnonymousIPResponse = {
  > Response,
  ?ip_address : String,
  ?is_anonymous : Bool,
  ?is_anonymous_proxy : Bool,
  ?is_anonymous_vpn : Bool,
  ?is_hosting_provider : Bool,
  ?is_public_proxy : Bool,
  ?is_tor_exit_node : Bool,
}

typedef AsnResponse = {
  > Response,
  autonomous_system_number : Int,
  autonomous_system_organization : String,
  ?ip_address : String,
}

typedef ConnectionTypeResponse = {
  > Response,
  connection_type : String,
  ?ip_address : String,
}

typedef DomainResponse = {
  > Response,
  domain : String,
  ?ip_address: String,
}

typedef IspResponse = {
  > AsnResponse,
  isp : String,
  organization : String,
}

typedef Metadata = {
  binaryFormatMajorVersion : Int,
  binaryFormatMinorVersion : Int,
  buildEpoch : Date,
  databaseType : String,
  languages : Array<String>,
  description : Dynamic,
  ipVersion : Int,
  nodeCount : Int,
  recordSize : Int,
  nodeByteSize : Int,
  searchTreeSize : Int,
  treeDepth : Int,
}

@:jsRequire('maxmind')
extern class Reader<T:Response> {
  public var metadata : Metadata;
  public function get(ipAddress : String) : T;
}
