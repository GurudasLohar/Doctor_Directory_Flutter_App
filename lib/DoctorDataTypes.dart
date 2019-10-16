import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';

class DoctorsByUIDResponse {
  Meta meta;
  Data data;

  DoctorsByUIDResponse({this.meta, this.data});

  DoctorsByUIDResponse.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.meta != null) {
      data['meta'] = this.meta.toJson();
    }
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Meta {
  String dataType;
  String itemType;
  int total;
  int count;
  int skip;
  int limit;
  String fieldsRequested;
  List<String> ignoredQueryParameters;

  Meta({this.dataType, this.itemType, this.total, this.count, this.skip, this.limit, this.fieldsRequested, this.ignoredQueryParameters});

  Meta.fromJson(Map<String, dynamic> json) {
    dataType = json['data_type'];
    itemType = json['item_type'];
    total = json['total'];
    count = json['count'];
    skip = json['skip'];
    limit = json['limit'];
    fieldsRequested = json['fields_requested'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['data_type'] = this.dataType;
    data['item_type'] = this.itemType;
    data['total'] = this.total;
    data['count'] = this.count;
    data['skip'] = this.skip;
    data['limit'] = this.limit;
    data['fields_requested'] = this.fieldsRequested;
    data['ignored_query_parameters'] = this.ignoredQueryParameters;
    return data;
  }
}

class Data {
  List<Practices> practices;
  List<Educations> educations;
  Profile profile;
  List<Ratings> ratings;
  List<Insurances> insurances;
  List<Specialties> specialties;
  List<HospitalAffiliations> hospitalAffiliations;
  List<Claims> claims;
  List<Licenses> licenses;
  String uid;
  String npi;

  Data({this.practices, this.educations, this.profile, this.ratings, this.insurances, this.specialties, this.hospitalAffiliations, this.claims, this.licenses, this.uid, this.npi});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['practices'] != null) {
      practices = new List<Practices>();
      json['practices'].forEach((v) { practices.add(new Practices.fromJson(v)); });
    }
    if (json['educations'] != null) {
      educations = new List<Educations>();
      json['educations'].forEach((v) { educations.add(new Educations.fromJson(v)); });
    }
    profile = json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['ratings'] != null) {
      ratings = new List<Ratings>();
      json['ratings'].forEach((v) { ratings.add(new Ratings.fromJson(v)); });
    }
    if (json['insurances'] != null) {
      insurances = new List<Insurances>();
      json['insurances'].forEach((v) { insurances.add(new Insurances.fromJson(v)); });
    }
    if (json['specialties'] != null) {
      specialties = new List<Specialties>();
      json['specialties'].forEach((v) { specialties.add(new Specialties.fromJson(v)); });
    }
    if (json['hospital_affiliations'] != null) {
      hospitalAffiliations = new List<HospitalAffiliations>();
      json['hospital_affiliations'].forEach((v) { hospitalAffiliations.add(new HospitalAffiliations.fromJson(v)); });
    }
    if (json['claims'] != null) {
      claims = new List<Claims>();
      json['claims'].forEach((v) { claims.add(new Claims.fromJson(v)); });
    }
    if (json['licenses'] != null) {
      licenses = new List<Licenses>();
      json['licenses'].forEach((v) { licenses.add(new Licenses.fromJson(v)); });
    }
    uid = json['uid'];
    npi = json['npi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.practices != null) {
      data['practices'] = this.practices.map((v) => v.toJson()).toList();
    }
    if (this.educations != null) {
      data['educations'] = this.educations.map((v) => v.toJson()).toList();
    }
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.ratings != null) {
      data['ratings'] = this.ratings.map((v) => v.toJson()).toList();
    }
    if (this.insurances != null) {
      data['insurances'] = this.insurances.map((v) => v.toJson()).toList();
    }
    if (this.specialties != null) {
      data['specialties'] = this.specialties.map((v) => v.toJson()).toList();
    }
    if (this.hospitalAffiliations != null) {
      data['hospital_affiliations'] = this.hospitalAffiliations.map((v) => v.toJson()).toList();
    }
    if (this.claims != null) {
      data['claims'] = this.claims.map((v) => v.toJson()).toList();
    }
    if (this.licenses != null) {
      data['licenses'] = this.licenses.map((v) => v.toJson()).toList();
    }
    data['uid'] = this.uid;
    data['npi'] = this.npi;
    return data;
  }
}

class Practices {
  String locationSlug;
  bool withinSearchArea;
  int distance;
  double lat;
  double lon;
  String uid;
  String npi;
  String tin;
  String slug;
  String name;
  String website;
  String email;
  String description;
  bool acceptsNewPatients;
  List<String> imageUrls;
  List<String> insuranceUids;
  Address visitAddress;
  List<String> officeHours;
  List<Phones> phones;
  List<Languages> languages;
  List<Media> media;
  int totalDoctors;
  String doctorsPaginationUrl;
  List<Doctors> doctors;

  Practices({this.locationSlug, this.withinSearchArea, this.distance, this.lat, this.lon, this.uid, this.npi, this.tin, this.slug, this.name, this.website, this.email, this.description, this.acceptsNewPatients, this.imageUrls, this.insuranceUids, this.visitAddress, this.officeHours, this.phones, this.languages, this.media, this.totalDoctors, this.doctorsPaginationUrl, this.doctors});

  Practices.fromJson(Map<String, dynamic> json) {
    locationSlug = json['location_slug'];
    // withinSearchArea = json['within_search_area'];
    //distance = json['distance'];
    lat = json['lat'];
    lon = json['lon'];
    uid = json['uid'];
    npi = json['npi'];
    tin = json['tin'];
    //slug = json['slug'];
    name = json['name'];
    website = json['website'];
    email = json['email'];
    description = json['description'];
    // acceptsNewPatients = json['accepts_new_patients'];
    imageUrls = new List<String>();
    if(json['image_urls'] !=null) {
      json['image_urls'].forEach((v) {
        imageUrls.add(v.toString());
      });
    }
    insuranceUids = new List<String>();
    if(json['insurance_uids'] !=null) {
      json['insurance_uids'].forEach((v) {
        insuranceUids.add(v.toString());
      });
    }
    if (json['phones'] != null) {
      phones = new List<Phones>();
      json['phones'].forEach((v) { phones.add(new Phones.fromJson(v)); });
    }
    /*
    visitAddress = json['visit_address'] != null ? new Address.fromJson(json['visit_address']) : null;
    if(json['office_hours']) {
      officeHours = new List<String>();
      json['office_hours'].forEach((v) {
        officeHours.add(v.toString());
      });
    }
    if (json['languages'] != null) {
      languages = new List<Languages>();
      json['languages'].forEach((v) { languages.add(new Languages.fromJson(v)); });
    }
    if (json['media'] != null) {
      media = new List<Media>();
      json['media'].forEach((v) { media.add(new Media.fromJson(v)); });
    }
    totalDoctors = json['total_doctors'];
    doctorsPaginationUrl = json['doctors_pagination_url'];
    if (json['doctors'] != null) {
      doctors = new List<Doctors>();
      json['doctors'].forEach((v) { doctors.add(new Doctors.fromJson(v)); });
    }*/
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['location_slug'] = this.locationSlug;
    data['within_search_area'] = this.withinSearchArea;
    data['distance'] = this.distance;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['uid'] = this.uid;
    data['npi'] = this.npi;
    data['tin'] = this.tin;

    data['slug'] = this.slug;
    data['name'] = this.name;
    data['website'] = this.website;

    data['email'] = this.email;

    data['description'] = this.description;

    data['accepts_new_patients'] = this.acceptsNewPatients;
    data['image_urls'] = this.imageUrls;
    data['insurance_uids'] = this.insuranceUids;
    if (this.visitAddress != null) {
      data['visit_address'] = this.visitAddress.toJson();
    }
    data['office_hours'] = this.officeHours;
    if (this.phones != null) {
      data['phones'] = this.phones.map((v) => v.toJson()).toList();
    }
    if (this.languages != null) {
      data['languages'] = this.languages.map((v) => v.toJson()).toList();
    }
    if (this.media != null) {
      data['media'] = this.media.map((v) => v.toJson()).toList();
    }
    data['total_doctors'] = this.totalDoctors;
    data['doctors_pagination_url'] = this.doctorsPaginationUrl;
    if (this.doctors != null) {
      data['doctors'] = this.doctors.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Address {
  String city;
  double lat;
  double lon;
  String state;
  String stateLong;
  String street;
  String street2;
  String zip;

  Address({this.city, this.lat, this.lon, this.state, this.stateLong, this.street, this.street2, this.zip});

  Address.fromJson(Map<String, dynamic> json) {
    city = json['city'];
    lat = json['lat'];
    lon = json['lon'];
    state = json['state'];
    stateLong = json['state_long'];
    street = json['street'];
    street2 = json['street2'];
    zip = json['zip'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['city'] = this.city;
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    data['state'] = this.state;
    data['state_long'] = this.stateLong;
    data['street'] = this.street;
    data['street2'] = this.street2;
    data['zip'] = this.zip;
    return data;
  }
}

class Phones {
  String number;
  String type;

  Phones({this.number, this.type});

  Phones.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    type = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['type'] = this.type;
    return data;
  }
}

class Languages {
  String name;
  String code;

  Languages({this.name, this.code});

  Languages.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    return data;
  }
}

class Media {
  String uid;
  String status;
  String url;
  List<String> tags;
  Versions versions;

  Media({this.uid, this.status, this.url, this.tags, this.versions});

  Media.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    status = json['status'];
    url = json['url'];
    //tags =   (json['tags'] as List).map((value) => (value).toString());
    versions = json['versions'] != null ? new Versions.fromJson(json['versions']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['status'] = this.status;
    data['url'] = this.url;
    data['tags'] = this.tags;
    if (this.versions != null) {
      data['versions'] = this.versions.toJson();
    }
    return data;
  }
}

class Versions {
  String thumbnail;
  String thumbnail2x;
  String small;
  String medium;
  String large;
  String hero;

  Versions({this.thumbnail, this.thumbnail2x, this.small, this.medium, this.large, this.hero});

  Versions.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    thumbnail2x = json['thumbnail2x'];
    small = json['small'];
    medium = json['medium'];
    large = json['large'];
    hero = json['hero'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['thumbnail'] = this.thumbnail;
    data['thumbnail2x'] = this.thumbnail2x;
    data['small'] = this.small;
    data['medium'] = this.medium;
    data['large'] = this.large;
    data['hero'] = this.hero;
    return data;
  }
}

class Doctors {
  List<Educations> educations;
  Profile profile;
  List<Ratings> ratings;
  List<Insurances> insurances;
  List<Specialties> specialties;
  List<HospitalAffiliations> hospitalAffiliations;
  List<Claims> claims;
  List<Licenses> licenses;
  String uid;
  String npi;

  Doctors({this.educations, this.profile, this.ratings, this.insurances, this.specialties, this.hospitalAffiliations, this.claims, this.licenses, this.uid, this.npi});

  Doctors.fromJson(Map<String, dynamic> json) {
    if (json['educations'] != null) {
      educations = new List<Educations>();
      json['educations'].forEach((v) { educations.add(new Educations.fromJson(v)); });
    }
    profile = json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    if (json['ratings'] != null) {
      ratings = new List<Ratings>();
      json['ratings'].forEach((v) { ratings.add(new Ratings.fromJson(v)); });
    }
    if (json['insurances'] != null) {
      insurances = new List<Insurances>();
      json['insurances'].forEach((v) { insurances.add(new Insurances.fromJson(v)); });
    }
    if (json['specialties'] != null) {
      specialties = new List<Specialties>();
      json['specialties'].forEach((v) { specialties.add(new Specialties.fromJson(v)); });
    }
    if (json['hospital_affiliations'] != null) {
      hospitalAffiliations = new List<HospitalAffiliations>();
      json['hospital_affiliations'].forEach((v) { hospitalAffiliations.add(new HospitalAffiliations.fromJson(v)); });
    }
    if (json['claims'] != null) {
      claims = new List<Claims>();
      json['claims'].forEach((v) { claims.add(new Claims.fromJson(v)); });
    }
    if (json['licenses'] != null) {
      licenses = new List<Licenses>();
      json['licenses'].forEach((v) { licenses.add(new Licenses.fromJson(v)); });
    }
    uid = json['uid'];
    npi = json['npi'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.educations != null) {
      data['educations'] = this.educations.map((v) => v.toJson()).toList();
    }
    if (this.profile != null) {
      data['profile'] = this.profile.toJson();
    }
    if (this.ratings != null) {
      data['ratings'] = this.ratings.map((v) => v.toJson()).toList();
    }
    if (this.insurances != null) {
      data['insurances'] = this.insurances.map((v) => v.toJson()).toList();
    }
    if (this.specialties != null) {
      data['specialties'] = this.specialties.map((v) => v.toJson()).toList();
    }
    if (this.hospitalAffiliations != null) {
      data['hospital_affiliations'] = this.hospitalAffiliations.map((v) => v.toJson()).toList();
    }
    if (this.claims != null) {
      data['claims'] = this.claims.map((v) => v.toJson()).toList();
    }
    if (this.licenses != null) {
      data['licenses'] = this.licenses.map((v) => v.toJson()).toList();
    }
    data['uid'] = this.uid;
    data['npi'] = this.npi;
    return data;
  }
}

class Educations {
  String school;
  String graduationYear;
  String degree;

  Educations({this.school, this.graduationYear, this.degree});

  Educations.fromJson(Map<String, dynamic> json) {
    school = json['school'];
    graduationYear = json['graduation_year'];
    degree = json['degree'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['school'] = this.school;

    data['graduation_year'] = this.graduationYear;

    data['degree'] = this.degree;
    return data;
  }
}

class Profile {
  String firstName;
  String middleName;
  String lastName;
  String slug;
  String title;
  String imageUrl;
  String gender;
  List<Languages> languages;
  String bio;

  Profile({this.firstName, this.middleName, this.lastName, this.slug, this.title, this.imageUrl, this.gender, this.languages, this.bio});

  Profile.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    middleName = json['middle_name'];
    lastName = json['last_name'];
    slug = json['slug'];
    title = json['title'];
    imageUrl = json['image_url'];
    gender = json['gender'];
    if (json['languages'] != null) {
      languages = new List<Languages>();
      json['languages'].forEach((v) { languages.add(new Languages.fromJson(v)); });
    }
    bio = json['bio'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['middle_name'] = this.middleName;
    data['last_name'] = this.lastName;
    data['slug'] = this.slug;
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['gender'] = this.gender;
    if (this.languages != null) {
      data['languages'] = this.languages.map((v) => v.toJson()).toList();
    }
    data['bio'] = this.bio;
    return data;
  }
}

class Ratings {
  bool active;
  String provider;
  String providerUid;
  String providerUrl;
  int rating;
  int reviewCount;
  String imageUrlSmall;
  String imageUrlSmall2x;
  String imageUrlLarge;
  String imageUrlLarge2x;

  Ratings({this.active, this.provider, this.providerUid, this.providerUrl, this.rating, this.reviewCount, this.imageUrlSmall, this.imageUrlSmall2x, this.imageUrlLarge, this.imageUrlLarge2x});

  Ratings.fromJson(Map<String, dynamic> json) {
    active = json['active'];
    provider = json['provider'];
    providerUid = json['provider_uid'];
    providerUrl = json['provider_url'];
    rating = json['rating'];
    reviewCount = json['review_count'];
    imageUrlSmall = json['image_url_small'];
    imageUrlSmall2x = json['image_url_small_2x'];
    imageUrlLarge = json['image_url_large'];
    imageUrlLarge2x = json['image_url_large_2x'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['active'] = this.active;
    data['provider'] = this.provider;
    data['provider_uid'] = this.providerUid;
    data['provider_url'] = this.providerUrl;
    data['rating'] = this.rating;
    data['review_count'] = this.reviewCount;
    data['image_url_small'] = this.imageUrlSmall;
    data['image_url_small_2x'] = this.imageUrlSmall2x;
    data['image_url_large'] = this.imageUrlLarge;
    data['image_url_large_2x'] = this.imageUrlLarge2x;
    return data;
  }
}

class Insurances {
  InsurancePlan insurancePlan;
  InsuranceProvider insuranceProvider;

  Insurances({this.insurancePlan, this.insuranceProvider});

  Insurances.fromJson(Map<String, dynamic> json) {
    insurancePlan = json['insurance_plan'] != null ? new InsurancePlan.fromJson(json['insurance_plan']) : null;
    insuranceProvider = json['insurance_provider'] != null ? new InsuranceProvider.fromJson(json['insurance_provider']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.insurancePlan != null) {
      data['insurance_plan'] = this.insurancePlan.toJson();
    }
    if (this.insuranceProvider != null) {
      data['insurance_provider'] = this.insuranceProvider.toJson();
    }
    return data;
  }
}

class InsurancePlan {
  String uid;
  String name;
  List<String> category;

  InsurancePlan({this.uid, this.name, this.category});

  InsurancePlan.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    //  category =  (json['category'] as List).map((value) => (value).toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['category'] = this.category;
    return data;
  }
}

class InsuranceProvider {
  String uid;
  String name;

  InsuranceProvider({this.uid, this.name});

  InsuranceProvider.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    return data;
  }
}

class Specialties {
  String uid;
  String name;
  String description;
  String category;
  String actor;
  String actors;

  Specialties({this.uid, this.name, this.description, this.category, this.actor, this.actors});

  Specialties.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    description = json['description'];
    category = json['category'];
    actor = json['actor'];
    actors = json['actors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['description'] = this.description;
    data['category'] = this.category;
    data['actor'] = this.actor;
    data['actors'] = this.actors;
    return data;
  }
}

class HospitalAffiliations {
  String uid;
  String name;
  String type;
  Address address;
  Phones phone;

  HospitalAffiliations({this.uid, this.name, this.type, this.address, this.phone});

  HospitalAffiliations.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    name = json['name'];
    type = json['type'];
    address = json['address'] != null ? new Address.fromJson(json['address']) : null;
    phone = json['phone'] != null ? new Phones.fromJson(json['phone']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['uid'] = this.uid;
    data['name'] = this.name;
    data['type'] = this.type;
    if (this.address != null) {
      data['address'] = this.address.toJson();
    }
    if (this.phone != null) {
      data['phone'] = this.phone.toJson();
    }
    return data;
  }
}

class Claims {
  String hcpcs;
  String hcpcsDescription;
  int serviceCnt;
  int beneUniqCnt;
  int avgAllowedAmt;
  int avgChargeAmt;
  int avgPaymentAmt;

  Claims({this.hcpcs, this.hcpcsDescription, this.serviceCnt, this.beneUniqCnt, this.avgAllowedAmt, this.avgChargeAmt, this.avgPaymentAmt});

  Claims.fromJson(Map<String, dynamic> json) {
    hcpcs = json['hcpcs'];
    hcpcsDescription = json['hcpcs_description'];
    serviceCnt = json['service_cnt'];
    beneUniqCnt = json['bene_uniq_cnt'];
    avgAllowedAmt = json['avg_allowed_amt'];
    avgChargeAmt = json['avg_charge_amt'];
    avgPaymentAmt = json['avg_payment_amt'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hcpcs'] = this.hcpcs;
    data['hcpcs_description'] = this.hcpcsDescription;
    data['service_cnt'] = this.serviceCnt;
    data['bene_uniq_cnt'] = this.beneUniqCnt;
    data['avg_allowed_amt'] = this.avgAllowedAmt;
    data['avg_charge_amt'] = this.avgChargeAmt;
    data['avg_payment_amt'] = this.avgPaymentAmt;
    return data;
  }
}

class Licenses {
  String number;
  String state;
  String endDate;

  Licenses({this.number, this.state, this.endDate});

  Licenses.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    state = json['state'] ;
    endDate = json['end_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['number'] = this.number;
    data['state'] = this.state;
    data['end_date'] = this.endDate;
    return data;
  }
}

class DoctorBasicDetail {
  Profile profile;
  String uid;

  DoctorBasicDetail({ this.profile, this.uid });

  DoctorBasicDetail.fromJson(Map<String, dynamic> json) {
    profile = json['profile'] != null ? new Profile.fromJson(json['profile']) : null;
    uid = json["uid"];
  }
}



class DoctorSearchResponse{

  Meta meta;
  List<DoctorBasicDetail> data;

  DoctorSearchResponse({ this.meta, this.data });

  DoctorSearchResponse.fromJson(Map<String, dynamic> json) {
    meta = json['meta'] != null ? new Meta.fromJson(json['meta']) : null;

    if (json['data'] != null) {
      data = new List<DoctorBasicDetail>();
      json['data'].forEach((v) { data.add(new DoctorBasicDetail.fromJson(v)); });
    }
  }
}