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

    public init(businessID: String, googleID: String, placeID: String, googleMid: String, phoneNumber: String, name: String, latitude: Double, longitude: Double, fullAddress: String, reviewCount: Int, rating: Double, timezone: String, workingHours: WorkingHours, website: String, verified: Bool, placeLink: String, cid: String, reviewsLink: String, ownerID: String, ownerLink: String, ownerName: String, businessStatus: String, type: String, subtypes: [String], photosSample: [PhotosSample], globalPlusCode: String, compoundPlusCode: String, reviewsPerRating: [String : Int], photoCount: Int, about: About, address: String, priceLevel: String, district: String, streetAddress: String, city: String, zipcode: String, state: String, country: String, reviewsSample: [ReviewsSample], emailsAndContacts: EmailsAndContacts) {
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

    // MARK: - EmailsAndContacts
    public struct EmailsAndContacts: Codable {
      public let emails, phoneNumbers: [String]
      public let facebook, instagram, yelp: String

      public enum CodingKeys: String, CodingKey {
        case emails
        case phoneNumbers = "phone_numbers"
        case facebook, instagram, yelp
      }

      public init(emails: [String], phoneNumbers: [String], facebook: String, instagram: String, yelp: String) {
        self.emails = emails
        self.phoneNumbers = phoneNumbers
        self.facebook = facebook
        self.instagram = instagram
        self.yelp = yelp
      }
    }

    // MARK: - About
    public struct About: Codable {
      public let summary: String?
      public let details: Details

      public init(summary: String?, details: Details) {
        self.summary = summary
        self.details = details
      }
    }

    // MARK: - Details
    public struct Details: Codable {
      public let serviceOptions: ServiceOptions
      public let highlights: Highlights?
      public let popularFor: PopularFor?
      public let accessibility: Accessibility
      public let offerings: [String: Bool]?
      public let diningOptions: DiningOptions?
      public let amenities: Amenities?
      public let atmosphere: Atmosphere?
      public let crowd: Crowd?
      public let payments: Payments?
      public let fromTheBusiness: FromTheBusiness?

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
    }

    // MARK: - Accessibility
    public struct Accessibility: Codable {
      public let wheelchairAccessibleEntrance: Bool
      public let wheelchairAccessibleParkingLot, wheelchairAccessibleRestroom, wheelchairAccessibleSeating, wheelchairAccessibleElevator: Bool?
      public let assistiveHearingLoop: Bool?

      public enum CodingKeys: String, CodingKey {
        case wheelchairAccessibleEntrance = "Wheelchair accessible entrance"
        case wheelchairAccessibleParkingLot = "Wheelchair accessible parking lot"
        case wheelchairAccessibleRestroom = "Wheelchair accessible restroom"
        case wheelchairAccessibleSeating = "Wheelchair accessible seating"
        case wheelchairAccessibleElevator = "Wheelchair accessible elevator"
        case assistiveHearingLoop = "Assistive hearing loop"
      }

      public init(wheelchairAccessibleEntrance: Bool, wheelchairAccessibleParkingLot: Bool?, wheelchairAccessibleRestroom: Bool?, wheelchairAccessibleSeating: Bool?, wheelchairAccessibleElevator: Bool?, assistiveHearingLoop: Bool?) {
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
      public let goodForKids, highChairs, restroom, wiFi: Bool?
      public let barOnsite, genderNeutralRestroom: Bool?

      public enum CodingKeys: String, CodingKey {
        case goodForKids = "Good for kids"
        case highChairs = "High chairs"
        case restroom = "Restroom"
        case wiFi = "Wi-Fi"
        case barOnsite = "Bar onsite"
        case genderNeutralRestroom = "Gender-neutral restroom"
      }

      public init(goodForKids: Bool?, highChairs: Bool?, restroom: Bool?, wiFi: Bool?, barOnsite: Bool?, genderNeutralRestroom: Bool?) {
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
      public let cozy, historic: Bool?

      public enum CodingKeys: String, CodingKey {
        case casual = "Casual"
        case cozy = "Cozy"
        case historic = "Historic"
      }

      public init(casual: Bool, cozy: Bool?, historic: Bool?) {
        self.casual = casual
        self.cozy = cozy
        self.historic = historic
      }
    }

    // MARK: - Crowd
    public struct Crowd: Codable {
      public let collegeStudents, groups, tourists, lgbtqFriendly: Bool?
      public let familyFriendly, transgenderSafespace: Bool?

      public enum CodingKeys: String, CodingKey {
        case collegeStudents = "College students"
        case groups = "Groups"
        case tourists = "Tourists"
        case lgbtqFriendly = "LGBTQ+ friendly"
        case familyFriendly = "Family-friendly"
        case transgenderSafespace = "Transgender safespace"
      }

      public init(collegeStudents: Bool?, groups: Bool?, tourists: Bool?, lgbtqFriendly: Bool?, familyFriendly: Bool?, transgenderSafespace: Bool?) {
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
      public let seating, dessert, catering, breakfast: Bool?
      public let brunch, counterService: Bool?

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

      public init(lunch: Bool, dinner: Bool, seating: Bool?, dessert: Bool?, catering: Bool?, breakfast: Bool?, brunch: Bool?, counterService: Bool?) {
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

      public init(identifiesAsWomenOwned: Bool) {
        self.identifiesAsWomenOwned = identifiesAsWomenOwned
      }
    }

    // MARK: - Highlights
    public struct Highlights: Codable {
      public let fastService: Bool
      public let greatBeerSelection, sports, rooftopSeating, liveMusic: Bool?

      public init(fastService: Bool, greatBeerSelection: Bool?, sports: Bool?, rooftopSeating: Bool?, liveMusic: Bool?) {
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
    }

    // MARK: - Payments
    public struct Payments: Codable {
      public let debitCards: Bool
      public let nfcMobilePayments, creditCards: Bool?

      public enum CodingKeys: String, CodingKey {
        case debitCards = "Debit cards"
        case nfcMobilePayments = "NFC mobile payments"
        case creditCards = "Credit cards"
      }

      public init(debitCards: Bool, nfcMobilePayments: Bool?, creditCards: Bool?) {
        self.debitCards = debitCards
        self.nfcMobilePayments = nfcMobilePayments
        self.creditCards = creditCards
      }
    }

    // MARK: - PopularFor
    public struct PopularFor: Codable {
      public let lunch, dinner: Bool
      public let soloDining: Bool?

      public enum CodingKeys: String, CodingKey {
        case lunch = "Lunch"
        case dinner = "Dinner"
        case soloDining = "Solo dining"
      }

      public init(lunch: Bool, dinner: Bool, soloDining: Bool?) {
        self.lunch = lunch
        self.dinner = dinner
        self.soloDining = soloDining
      }
    }

    // MARK: - ServiceOptions
    public struct ServiceOptions: Codable {
      public let takeout: Bool
      public let dineIn, outdoorSeating, curbsidePickup, delivery: Bool?
      public let noContactDelivery: Bool?

      public enum CodingKeys: String, CodingKey {
        case takeout = "Takeout"
        case dineIn = "Dine-in"
        case outdoorSeating = "Outdoor seating"
        case curbsidePickup = "Curbside pickup"
        case delivery = "Delivery"
        case noContactDelivery = "No-contact delivery"
      }

      public init(takeout: Bool, dineIn: Bool?, outdoorSeating: Bool?, curbsidePickup: Bool?, delivery: Bool?, noContactDelivery: Bool?) {
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

      public init(saturday: [String], sunday: [String], monday: [String], tuesday: [String], wednesday: [String], thursday: [String], friday: [String]) {
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

}
