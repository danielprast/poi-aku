//
//  PoiDetailResponseModel.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


public typealias PoiDetailResponseModel = PoiModule.Data.Response.PoiDetail


extension PoiModule.Data.Response {

  public struct PoiDetail: Codable {
    public let businessID, googleID, placeID, googleMid: String
    public let phoneNumber, name: String
    public let latitude, longitude: Double
    public let fullAddress: String
    public let reviewCount: Int
    public let rating: Double
    public let timezone: String
    public let workingHours: WorkingHours
    public let website: String
    public let verified: Bool
    public let placeLink: String
    public let cid: String
    public let reviewsLink: String
    public let ownerID: String
    public let ownerLink: String
    public let ownerName, businessStatus, type: String
    public let subtypes: [String]
    public let photosSample: [PhotosSample]
    public let globalPlusCode, compoundPlusCode: String
    public let reviewsPerRating: [String: Int]
    public let photoCount: Int
    public let about: About
    public let address, priceLevel, district, streetAddress: String
    public let city, zipcode, state, country: String
    public let reviewsSample: [ReviewsSample]
    public let emailsAndContacts: EmailsAndContacts

    public enum CodingKeys: String, CodingKey {
      case businessID = "business_id"
      case googleID = "google_id"
      case placeID = "place_id"
      case googleMid = "google_mid"
      case phoneNumber = "phone_number"
      case name, latitude, longitude
      case fullAddress = "full_address"
      case reviewCount = "review_count"
      case rating, timezone
      case workingHours = "working_hours"
      case website, verified
      case placeLink = "place_link"
      case cid
      case reviewsLink = "reviews_link"
      case ownerID = "owner_id"
      case ownerLink = "owner_link"
      case ownerName = "owner_name"
      case businessStatus = "business_status"
      case type, subtypes
      case photosSample = "photos_sample"
      case globalPlusCode = "global_plus_code"
      case compoundPlusCode = "compound_plus_code"
      case reviewsPerRating = "reviews_per_rating"
      case photoCount = "photo_count"
      case about, address
      case priceLevel = "price_level"
      case district
      case streetAddress = "street_address"
      case city, zipcode, state, country
      case reviewsSample = "reviews_sample"
      case emailsAndContacts = "emails_and_contacts"
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.PoiDetail.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.PoiDetail.CodingKeys.self)
      self.businessID = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.businessID) ?? ""
      self.googleID = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.googleID) ?? ""
      self.placeID = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.placeID) ?? ""
      self.googleMid = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.googleMid) ?? ""
      self.phoneNumber = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.phoneNumber) ?? ""
      self.name = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.name) ?? ""
      self.latitude = try container.decodeIfPresent(Double.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.latitude) ?? 0.0
      self.longitude = try container.decodeIfPresent(Double.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.longitude) ?? 0.0
      self.fullAddress = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.fullAddress) ?? ""
      self.reviewCount = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.reviewCount) ?? 0
      self.rating = try container.decodeIfPresent(Double.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.rating) ?? 0.0
      self.timezone = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.timezone) ?? ""
      self.workingHours = try container.decodeIfPresent(PoiModule.Data.Response.WorkingHours.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.workingHours) ?? .init()
      self.website = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.website) ?? ""
      self.verified = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.verified) ?? false
      self.placeLink = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.placeLink) ?? ""
      self.cid = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.cid) ?? ""
      self.reviewsLink = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.reviewsLink) ?? ""
      self.ownerID = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.ownerID) ?? ""
      self.ownerLink = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.ownerLink) ?? ""
      self.ownerName = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.ownerName) ?? ""
      self.businessStatus = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.businessStatus) ?? ""
      self.type = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.type) ?? ""
      self.subtypes = try container.decodeIfPresent([String].self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.subtypes) ?? []
      self.photosSample = try container.decodeIfPresent([PoiModule.Data.Response.PhotosSample].self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.photosSample) ?? []
      self.globalPlusCode = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.globalPlusCode) ?? ""
      self.compoundPlusCode = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.compoundPlusCode) ?? ""
      self.reviewsPerRating = try container.decodeIfPresent([String : Int].self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.reviewsPerRating) ?? [:]
      self.photoCount = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.photoCount) ?? 0
      self.about = try container.decodeIfPresent(PoiModule.Data.Response.About.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.about) ?? .init()
      self.address = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.address) ?? ""
      self.priceLevel = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.priceLevel) ?? ""
      self.district = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.district) ?? ""
      self.streetAddress = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.streetAddress) ?? ""
      self.city = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.city) ?? ""
      self.zipcode = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.zipcode) ?? ""
      self.state = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.state) ?? ""
      self.country = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.country) ?? ""
      self.reviewsSample = try container.decodeIfPresent([PoiModule.Data.Response.ReviewsSample].self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.reviewsSample) ?? .init()
      self.emailsAndContacts = try container.decodeIfPresent(PoiModule.Data.Response.EmailsAndContacts.self, forKey: PoiModule.Data.Response.PoiDetail.CodingKeys.emailsAndContacts) ?? .init()
    }

    public init(
      businessID: String = "",
      googleID: String = "",
      placeID: String = "",
      googleMid: String = "",
      phoneNumber: String = "",
      name: String = "",
      latitude: Double = 0.0,
      longitude: Double = 0.0,
      fullAddress: String = "",
      reviewCount: Int = 0,
      rating: Double = 0.0,
      timezone: String = "",
      workingHours: WorkingHours = .init(),
      website: String = "",
      verified: Bool = false,
      placeLink: String = "",
      cid: String = "",
      reviewsLink: String = "",
      ownerID: String = "",
      ownerLink: String = "",
      ownerName: String = "",
      businessStatus: String = "",
      type: String = "",
      subtypes: [String] = [],
      photosSample: [PhotosSample] = [],
      globalPlusCode: String = "",
      compoundPlusCode: String = "",
      reviewsPerRating: [String : Int] = [:],
      photoCount: Int = 0,
      about: About = .init(),
      address: String = "",
      priceLevel: String = "",
      district: String = "",
      streetAddress: String = "",
      city: String = "",
      zipcode: String = "",
      state: String = "",
      country: String = "",
      reviewsSample: [ReviewsSample] = [],
      emailsAndContacts: EmailsAndContacts = .init()
    ) {
      self.businessID = businessID
      self.googleID = googleID
      self.placeID = placeID
      self.googleMid = googleMid
      self.phoneNumber = phoneNumber
      self.name = name
      self.latitude = latitude
      self.longitude = longitude
      self.fullAddress = fullAddress
      self.reviewCount = reviewCount
      self.rating = rating
      self.timezone = timezone
      self.workingHours = workingHours
      self.website = website
      self.verified = verified
      self.placeLink = placeLink
      self.cid = cid
      self.reviewsLink = reviewsLink
      self.ownerID = ownerID
      self.ownerLink = ownerLink
      self.ownerName = ownerName
      self.businessStatus = businessStatus
      self.type = type
      self.subtypes = subtypes
      self.photosSample = photosSample
      self.globalPlusCode = globalPlusCode
      self.compoundPlusCode = compoundPlusCode
      self.reviewsPerRating = reviewsPerRating
      self.photoCount = photoCount
      self.about = about
      self.address = address
      self.priceLevel = priceLevel
      self.district = district
      self.streetAddress = streetAddress
      self.city = city
      self.zipcode = zipcode
      self.state = state
      self.country = country
      self.reviewsSample = reviewsSample
      self.emailsAndContacts = emailsAndContacts
    }
  }

}


extension PoiModule.Data.Response {

  // MARK: - EmailsAndContacts
  public struct EmailsAndContacts: Codable {
    public let emails, phoneNumbers: [String]
    public let facebook, instagram, yelp: String

    public enum CodingKeys: String, CodingKey {
      case emails
      case phoneNumbers = "phone_numbers"
      case facebook, instagram, yelp
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.EmailsAndContacts.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.EmailsAndContacts.CodingKeys.self)
      self.emails = try container.decodeIfPresent([String].self, forKey: PoiModule.Data.Response.EmailsAndContacts.CodingKeys.emails) ?? []
      self.phoneNumbers = try container.decodeIfPresent([String].self, forKey: PoiModule.Data.Response.EmailsAndContacts.CodingKeys.phoneNumbers) ?? []
      self.facebook = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.EmailsAndContacts.CodingKeys.facebook) ?? ""
      self.instagram = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.EmailsAndContacts.CodingKeys.instagram) ?? ""
      self.yelp = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.EmailsAndContacts.CodingKeys.yelp) ?? ""
    }

    public init(emails: [String] = [], phoneNumbers: [String] = [], facebook: String = "", instagram: String = "", yelp: String = "") {
      self.emails = emails
      self.phoneNumbers = phoneNumbers
      self.facebook = facebook
      self.instagram = instagram
      self.yelp = yelp
    }
  }

  // MARK: - About
  public struct About: Codable {
    public let summary: String
    public let details: Details

    public init(summary: String = "", details: Details = .init()) {
      self.summary = summary
      self.details = details
    }

    enum CodingKeys: CodingKey {
      case summary
      case details
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.About.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.About.CodingKeys.self)
      self.summary = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.About.CodingKeys.summary) ?? ""
      self.details = try container.decodeIfPresent(PoiModule.Data.Response.Details.self, forKey: PoiModule.Data.Response.About.CodingKeys.details) ?? .init()
    }
  }

  // MARK: - Details
  public struct Details: Codable {
    public let serviceOptions: ServiceOptions
    public let highlights: Highlights
    public let popularFor: PopularFor
    public let accessibility: Accessibility
    public let offerings: [String: Bool]
    public let diningOptions: DiningOptions
    public let amenities: Amenities
    public let atmosphere: Atmosphere
    public let crowd: Crowd
    public let payments: Payments
    public let fromTheBusiness: FromTheBusiness

    public enum CodingKeys: String, CodingKey {
      case serviceOptions = "Service options"
      case highlights = "Highlights"
      case popularFor = "Popular for"
      case accessibility = "Accessibility"
      case offerings = "Offerings"
      case diningOptions = "Dining options"
      case amenities = "Amenities"
      case atmosphere = "Atmosphere"
      case crowd = "Crowd"
      case payments = "Payments"
      case fromTheBusiness = "From the business"
    }

    public init(
      serviceOptions: ServiceOptions = .init(),
      highlights: Highlights = .init(),
      popularFor: PopularFor = .init(),
      accessibility: Accessibility = .init(),
      offerings: [String : Bool] = [:],
      diningOptions: DiningOptions = .init(),
      amenities: Amenities = .init(),
      atmosphere: Atmosphere = .init(),
      crowd: Crowd = .init(),
      payments: Payments = .init(),
      fromTheBusiness: FromTheBusiness = .init()
    ) {
      self.serviceOptions = serviceOptions
      self.highlights = highlights
      self.popularFor = popularFor
      self.accessibility = accessibility
      self.offerings = offerings
      self.diningOptions = diningOptions
      self.amenities = amenities
      self.atmosphere = atmosphere
      self.crowd = crowd
      self.payments = payments
      self.fromTheBusiness = fromTheBusiness
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.Details.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.Details.CodingKeys.self)
      self.serviceOptions = try container.decodeIfPresent(PoiModule.Data.Response.ServiceOptions.self, forKey: PoiModule.Data.Response.Details.CodingKeys.serviceOptions) ?? .init()
      self.highlights = try container.decodeIfPresent(PoiModule.Data.Response.Highlights.self, forKey: PoiModule.Data.Response.Details.CodingKeys.highlights) ?? .init()
      self.popularFor = try container.decodeIfPresent(PoiModule.Data.Response.PopularFor.self, forKey: PoiModule.Data.Response.Details.CodingKeys.popularFor) ?? .init()
      self.accessibility = try container.decodeIfPresent(PoiModule.Data.Response.Accessibility.self, forKey: PoiModule.Data.Response.Details.CodingKeys.accessibility) ?? .init()
      self.offerings = try container.decodeIfPresent([String : Bool].self, forKey: PoiModule.Data.Response.Details.CodingKeys.offerings) ?? .init()
      self.diningOptions = try container.decodeIfPresent(PoiModule.Data.Response.DiningOptions.self, forKey: PoiModule.Data.Response.Details.CodingKeys.diningOptions) ?? .init()
      self.amenities = try container.decodeIfPresent(PoiModule.Data.Response.Amenities.self, forKey: PoiModule.Data.Response.Details.CodingKeys.amenities) ?? .init()
      self.atmosphere = try container.decodeIfPresent(PoiModule.Data.Response.Atmosphere.self, forKey: PoiModule.Data.Response.Details.CodingKeys.atmosphere) ?? .init()
      self.crowd = try container.decodeIfPresent(PoiModule.Data.Response.Crowd.self, forKey: PoiModule.Data.Response.Details.CodingKeys.crowd) ?? .init()
      self.payments = try container.decodeIfPresent(PoiModule.Data.Response.Payments.self, forKey: PoiModule.Data.Response.Details.CodingKeys.payments) ?? .init()
      self.fromTheBusiness = try container.decodeIfPresent(PoiModule.Data.Response.FromTheBusiness.self, forKey: PoiModule.Data.Response.Details.CodingKeys.fromTheBusiness) ?? .init()
    }
  }

  // MARK: - Accessibility
  public struct Accessibility: Codable {
    public let wheelchairAccessibleEntrance: Bool
    public let wheelchairAccessibleParkingLot, wheelchairAccessibleRestroom, wheelchairAccessibleSeating, wheelchairAccessibleElevator: Bool
    public let assistiveHearingLoop: Bool

    public enum CodingKeys: String, CodingKey {
      case wheelchairAccessibleEntrance = "Wheelchair accessible entrance"
      case wheelchairAccessibleParkingLot = "Wheelchair accessible parking lot"
      case wheelchairAccessibleRestroom = "Wheelchair accessible restroom"
      case wheelchairAccessibleSeating = "Wheelchair accessible seating"
      case wheelchairAccessibleElevator = "Wheelchair accessible elevator"
      case assistiveHearingLoop = "Assistive hearing loop"
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.Accessibility.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.Accessibility.CodingKeys.self)
      self.wheelchairAccessibleEntrance = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Accessibility.CodingKeys.wheelchairAccessibleEntrance) ?? false
      self.wheelchairAccessibleParkingLot = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Accessibility.CodingKeys.wheelchairAccessibleParkingLot) ?? false
      self.wheelchairAccessibleRestroom = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Accessibility.CodingKeys.wheelchairAccessibleRestroom) ?? false
      self.wheelchairAccessibleSeating = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Accessibility.CodingKeys.wheelchairAccessibleSeating) ?? false
      self.wheelchairAccessibleElevator = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Accessibility.CodingKeys.wheelchairAccessibleElevator) ?? false
      self.assistiveHearingLoop = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Accessibility.CodingKeys.assistiveHearingLoop) ?? false
    }

    public init(wheelchairAccessibleEntrance: Bool = false, wheelchairAccessibleParkingLot: Bool = false, wheelchairAccessibleRestroom: Bool = false, wheelchairAccessibleSeating: Bool = false, wheelchairAccessibleElevator: Bool = false, assistiveHearingLoop: Bool = false) {
      self.wheelchairAccessibleEntrance = wheelchairAccessibleEntrance
      self.wheelchairAccessibleParkingLot = wheelchairAccessibleParkingLot
      self.wheelchairAccessibleRestroom = wheelchairAccessibleRestroom
      self.wheelchairAccessibleSeating = wheelchairAccessibleSeating
      self.wheelchairAccessibleElevator = wheelchairAccessibleElevator
      self.assistiveHearingLoop = assistiveHearingLoop
    }
  }

  // MARK: - Amenities
  public struct Amenities: Codable {
    public let goodForKids, highChairs, restroom, wiFi: Bool
    public let barOnsite, genderNeutralRestroom: Bool

    public enum CodingKeys: String, CodingKey {
      case goodForKids = "Good for kids"
      case highChairs = "High chairs"
      case restroom = "Restroom"
      case wiFi = "Wi-Fi"
      case barOnsite = "Bar onsite"
      case genderNeutralRestroom = "Gender-neutral restroom"
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.Amenities.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.Amenities.CodingKeys.self)
      self.goodForKids = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Amenities.CodingKeys.goodForKids) ?? false
      self.highChairs = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Amenities.CodingKeys.highChairs) ?? false
      self.restroom = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Amenities.CodingKeys.restroom) ?? false
      self.wiFi = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Amenities.CodingKeys.wiFi) ?? false
      self.barOnsite = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Amenities.CodingKeys.barOnsite) ?? false
      self.genderNeutralRestroom = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Amenities.CodingKeys.genderNeutralRestroom) ?? false
    }

    public init(goodForKids: Bool = false, highChairs: Bool = false, restroom: Bool = false, wiFi: Bool = false, barOnsite: Bool = false, genderNeutralRestroom: Bool = false) {
      self.goodForKids = goodForKids
      self.highChairs = highChairs
      self.restroom = restroom
      self.wiFi = wiFi
      self.barOnsite = barOnsite
      self.genderNeutralRestroom = genderNeutralRestroom
    }
  }

  // MARK: - Atmosphere
  public struct Atmosphere: Codable {
    public let casual: Bool
    public let cozy, historic: Bool

    public enum CodingKeys: String, CodingKey {
      case casual = "Casual"
      case cozy = "Cozy"
      case historic = "Historic"
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.Atmosphere.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.Atmosphere.CodingKeys.self)
      self.casual = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Atmosphere.CodingKeys.casual) ?? false
      self.cozy = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Atmosphere.CodingKeys.cozy) ?? false
      self.historic = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Atmosphere.CodingKeys.historic) ?? false
    }

    public init(casual: Bool = false, cozy: Bool = false, historic: Bool = false) {
      self.casual = casual
      self.cozy = cozy
      self.historic = historic
    }
  }

  // MARK: - Crowd
  public struct Crowd: Codable {
    public let collegeStudents, groups, tourists, lgbtqFriendly: Bool
    public let familyFriendly, transgenderSafespace: Bool

    public enum CodingKeys: String, CodingKey {
      case collegeStudents = "College students"
      case groups = "Groups"
      case tourists = "Tourists"
      case lgbtqFriendly = "LGBTQ+ friendly"
      case familyFriendly = "Family-friendly"
      case transgenderSafespace = "Transgender safespace"
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.Crowd.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.Crowd.CodingKeys.self)
      self.collegeStudents = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Crowd.CodingKeys.collegeStudents) ?? false
      self.groups = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Crowd.CodingKeys.groups) ?? false
      self.tourists = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Crowd.CodingKeys.tourists) ?? false
      self.lgbtqFriendly = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Crowd.CodingKeys.lgbtqFriendly) ?? false
      self.familyFriendly = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Crowd.CodingKeys.familyFriendly) ?? false
      self.transgenderSafespace = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Crowd.CodingKeys.transgenderSafespace) ?? false
    }

    public init(collegeStudents: Bool = false, groups: Bool = false, tourists: Bool = false, lgbtqFriendly: Bool = false, familyFriendly: Bool = false, transgenderSafespace: Bool = false) {
      self.collegeStudents = collegeStudents
      self.groups = groups
      self.tourists = tourists
      self.lgbtqFriendly = lgbtqFriendly
      self.familyFriendly = familyFriendly
      self.transgenderSafespace = transgenderSafespace
    }
  }

  // MARK: - DiningOptions
  public struct DiningOptions: Codable {
    public let lunch, dinner: Bool
    public let seating, dessert, catering, breakfast: Bool
    public let brunch, counterService: Bool

    public enum CodingKeys: String, CodingKey {
      case lunch = "Lunch"
      case dinner = "Dinner"
      case seating = "Seating"
      case dessert = "Dessert"
      case catering = "Catering"
      case breakfast = "Breakfast"
      case brunch = "Brunch"
      case counterService = "Counter service"
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.DiningOptions.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.DiningOptions.CodingKeys.self)
      self.lunch = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.DiningOptions.CodingKeys.lunch) ?? false
      self.dinner = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.DiningOptions.CodingKeys.dinner) ?? false
      self.seating = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.DiningOptions.CodingKeys.seating) ?? false
      self.dessert = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.DiningOptions.CodingKeys.dessert) ?? false
      self.catering = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.DiningOptions.CodingKeys.catering) ?? false
      self.breakfast = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.DiningOptions.CodingKeys.breakfast) ?? false
      self.brunch = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.DiningOptions.CodingKeys.brunch) ?? false
      self.counterService = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.DiningOptions.CodingKeys.counterService) ?? false
    }

    public init(lunch: Bool = false, dinner: Bool = false, seating: Bool = false, dessert: Bool = false, catering: Bool = false, breakfast: Bool = false, brunch: Bool = false, counterService: Bool = false) {
      self.lunch = lunch
      self.dinner = dinner
      self.seating = seating
      self.dessert = dessert
      self.catering = catering
      self.breakfast = breakfast
      self.brunch = brunch
      self.counterService = counterService
    }
  }

  // MARK: - FromTheBusiness
  public struct FromTheBusiness: Codable {
    public let identifiesAsWomenOwned: Bool

    public enum CodingKeys: String, CodingKey {
      case identifiesAsWomenOwned = "Identifies as women-owned"
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.FromTheBusiness.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.FromTheBusiness.CodingKeys.self)
      self.identifiesAsWomenOwned = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.FromTheBusiness.CodingKeys.identifiesAsWomenOwned) ?? false
    }

    public init(identifiesAsWomenOwned: Bool = false) {
      self.identifiesAsWomenOwned = identifiesAsWomenOwned
    }
  }

  // MARK: - Highlights
  public struct Highlights: Codable {
    public let fastService: Bool
    public let greatBeerSelection, sports, rooftopSeating, liveMusic: Bool

    public init(fastService: Bool = false, greatBeerSelection: Bool = false, sports: Bool = false, rooftopSeating: Bool = false, liveMusic: Bool = false) {
      self.fastService = fastService
      self.greatBeerSelection = greatBeerSelection
      self.sports = sports
      self.rooftopSeating = rooftopSeating
      self.liveMusic = liveMusic
    }

    public enum CodingKeys: String, CodingKey {
      case fastService = "Fast service"
      case greatBeerSelection = "Great beer selection"
      case sports = "Sports"
      case rooftopSeating = "Rooftop seating"
      case liveMusic = "Live music"
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.Highlights.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.Highlights.CodingKeys.self)
      self.fastService = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Highlights.CodingKeys.fastService) ?? false
      self.greatBeerSelection = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Highlights.CodingKeys.greatBeerSelection) ?? false
      self.sports = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Highlights.CodingKeys.sports) ?? false
      self.rooftopSeating = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Highlights.CodingKeys.rooftopSeating) ?? false
      self.liveMusic = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Highlights.CodingKeys.liveMusic) ?? false
    }
  }

  // MARK: - Payments
  public struct Payments: Codable {
    public let debitCards: Bool
    public let nfcMobilePayments, creditCards: Bool

    public enum CodingKeys: String, CodingKey {
      case debitCards = "Debit cards"
      case nfcMobilePayments = "NFC mobile payments"
      case creditCards = "Credit cards"
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.Payments.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.Payments.CodingKeys.self)
      self.debitCards = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Payments.CodingKeys.debitCards) ?? false
      self.nfcMobilePayments = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Payments.CodingKeys.nfcMobilePayments) ?? false
      self.creditCards = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.Payments.CodingKeys.creditCards) ?? false
    }

    public init(debitCards: Bool = false, nfcMobilePayments: Bool = false, creditCards: Bool = false) {
      self.debitCards = debitCards
      self.nfcMobilePayments = nfcMobilePayments
      self.creditCards = creditCards
    }
  }

  // MARK: - PopularFor
  public struct PopularFor: Codable {
    public let lunch, dinner: Bool
    public let soloDining: Bool

    public enum CodingKeys: String, CodingKey {
      case lunch = "Lunch"
      case dinner = "Dinner"
      case soloDining = "Solo dining"
    }

    public init(lunch: Bool = false, dinner: Bool = false, soloDining: Bool = false) {
      self.lunch = lunch
      self.dinner = dinner
      self.soloDining = soloDining
    }
  }

  // MARK: - ServiceOptions
  public struct ServiceOptions: Codable {
    public let takeout: Bool
    public let dineIn, outdoorSeating, curbsidePickup, delivery: Bool
    public let noContactDelivery: Bool

    public enum CodingKeys: String, CodingKey {
      case takeout = "Takeout"
      case dineIn = "Dine-in"
      case outdoorSeating = "Outdoor seating"
      case curbsidePickup = "Curbside pickup"
      case delivery = "Delivery"
      case noContactDelivery = "No-contact delivery"
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.ServiceOptions.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.ServiceOptions.CodingKeys.self)
      self.takeout = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.ServiceOptions.CodingKeys.takeout) ?? false
      self.dineIn = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.ServiceOptions.CodingKeys.dineIn) ?? false
      self.outdoorSeating = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.ServiceOptions.CodingKeys.outdoorSeating) ?? false
      self.curbsidePickup = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.ServiceOptions.CodingKeys.curbsidePickup) ?? false
      self.delivery = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.ServiceOptions.CodingKeys.delivery) ?? false
      self.noContactDelivery = try container.decodeIfPresent(Bool.self, forKey: PoiModule.Data.Response.ServiceOptions.CodingKeys.noContactDelivery) ?? false
    }

    public init(takeout: Bool = false, dineIn: Bool = false, outdoorSeating: Bool = false, curbsidePickup: Bool = false, delivery: Bool = false, noContactDelivery: Bool = false) {
      self.takeout = takeout
      self.dineIn = dineIn
      self.outdoorSeating = outdoorSeating
      self.curbsidePickup = curbsidePickup
      self.delivery = delivery
      self.noContactDelivery = noContactDelivery
    }
  }

  // MARK: - WorkingHours
  public struct WorkingHours: Codable {
    public let saturday, sunday, monday, tuesday: [String]
    public let wednesday, thursday, friday: [String]

    public init(
      saturday: [String] = [],
      sunday: [String] = [],
      monday: [String] = [],
      tuesday: [String] = [],
      wednesday: [String] = [],
      thursday: [String] = [],
      friday: [String] = []
    ) {
      self.saturday = saturday
      self.sunday = sunday
      self.monday = monday
      self.tuesday = tuesday
      self.wednesday = wednesday
      self.thursday = thursday
      self.friday = friday
    }

    public enum CodingKeys: String, CodingKey {
      case saturday = "Saturday"
      case sunday = "Sunday"
      case monday = "Monday"
      case tuesday = "Tuesday"
      case wednesday = "Wednesday"
      case thursday = "Thursday"
      case friday = "Friday"
    }
  }

  // MARK: - Parameters
  public struct Parameters: Codable {
    public let query, language, region: String
    public let lat, lng: Double
    public let zoom, limit: Int

    public init(query: String, language: String, region: String, lat: Double, lng: Double, zoom: Int, limit: Int) {
      self.query = query
      self.language = language
      self.region = region
      self.lat = lat
      self.lng = lng
      self.zoom = zoom
      self.limit = limit
    }
  }
}
