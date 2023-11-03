//
//  PoiReviewResponseModel.swift
//  Created by Daniel Prastiwa on 03/11/23.
//

import Foundation


public typealias PoiReviewResponseModel = PoiModule.Data.Response.ReviewsSample


extension PoiModule.Data.Response {

  public struct ReviewsSample: Codable {
    public let reviewID, reviewText: String
    public let rating: Int
    public let reviewDatetimeUTC: String
    public let reviewTimestamp: Int
    public let reviewLink: String
    public let reviewPhotos: [String]?
    public let reviewLanguage: String
    public let likeCount: Int
    public let authorID: String
    public let authorLink: String
    public let authorName: String
    public let authorPhotoURL: String
    public let authorReviewCount: Int
    public let authorReviewsLink: String
    public let authorLocalGuideLevel: Int?
    public let hotelRatingBreakdown: HotelRatingBreakdown?
    public let reviewForm: [String: String]
    public let thorLocalGuideLevel: Int?

    public enum CodingKeys: String, CodingKey {
      case reviewID = "review_id"
      case reviewText = "review_text"
      case rating
      case reviewDatetimeUTC = "review_datetime_utc"
      case reviewTimestamp = "review_timestamp"
      case reviewLink = "review_link"
      case reviewPhotos = "review_photos"
      case reviewLanguage = "review_language"
      case likeCount = "like_count"
      case authorID = "author_id"
      case authorLink = "author_link"
      case authorName = "author_name"
      case authorPhotoURL = "author_photo_url"
      case authorReviewCount = "author_review_count"
      case authorReviewsLink = "author_reviews_link"
      case authorLocalGuideLevel = "author_local_guide_level"
      case hotelRatingBreakdown = "hotel_rating_breakdown"
      case reviewForm = "review_form"
      case thorLocalGuideLevel = "thor_local_guide_level"
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.ReviewsSample.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.ReviewsSample.CodingKeys.self)
      self.reviewID = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.reviewID) ?? ""
      self.reviewText = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.reviewText) ?? ""
      self.rating = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.rating) ?? 0
      self.reviewDatetimeUTC = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.reviewDatetimeUTC) ?? ""
      self.reviewTimestamp = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.reviewTimestamp) ?? 0
      self.reviewLink = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.reviewLink) ?? ""
      self.reviewPhotos = try container.decodeIfPresent([String].self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.reviewPhotos) ?? []
      self.reviewLanguage = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.reviewLanguage) ?? ""
      self.likeCount = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.likeCount) ?? 0
      self.authorID = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.authorID) ?? ""
      self.authorLink = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.authorLink) ?? ""
      self.authorName = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.authorName) ?? ""
      self.authorPhotoURL = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.authorPhotoURL) ?? ""
      self.authorReviewCount = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.authorReviewCount) ?? 0
      self.authorReviewsLink = try container.decodeIfPresent(String.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.authorReviewsLink) ?? ""
      self.authorLocalGuideLevel = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.authorLocalGuideLevel)
      self.hotelRatingBreakdown = try container.decodeIfPresent(PoiModule.Data.Response.HotelRatingBreakdown.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.hotelRatingBreakdown)
      self.reviewForm = try container.decodeIfPresent([String : String].self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.reviewForm) ?? [:]
      self.thorLocalGuideLevel = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.ReviewsSample.CodingKeys.thorLocalGuideLevel)
    }

    public init(reviewID: String, reviewText: String, rating: Int, reviewDatetimeUTC: String, reviewTimestamp: Int, reviewLink: String, reviewPhotos: [String]?, reviewLanguage: String, likeCount: Int, authorID: String, authorLink: String, authorName: String, authorPhotoURL: String, authorReviewCount: Int, authorReviewsLink: String, authorLocalGuideLevel: Int?, hotelRatingBreakdown: HotelRatingBreakdown?, reviewForm: [String : String], thorLocalGuideLevel: Int?) {
      self.reviewID = reviewID
      self.reviewText = reviewText
      self.rating = rating
      self.reviewDatetimeUTC = reviewDatetimeUTC
      self.reviewTimestamp = reviewTimestamp
      self.reviewLink = reviewLink
      self.reviewPhotos = reviewPhotos
      self.reviewLanguage = reviewLanguage
      self.likeCount = likeCount
      self.authorID = authorID
      self.authorLink = authorLink
      self.authorName = authorName
      self.authorPhotoURL = authorPhotoURL
      self.authorReviewCount = authorReviewCount
      self.authorReviewsLink = authorReviewsLink
      self.authorLocalGuideLevel = authorLocalGuideLevel
      self.hotelRatingBreakdown = hotelRatingBreakdown
      self.reviewForm = reviewForm
      self.thorLocalGuideLevel = thorLocalGuideLevel
    }
  }

  // MARK: - HotelRatingBreakdown
  public struct HotelRatingBreakdown: Codable {
    public let food, service: Int
    public let atmosphere: Int

    public enum CodingKeys: String, CodingKey {
      case food = "Food"
      case service = "Service"
      case atmosphere = "Atmosphere"
    }

    public init(food: Int = 0, service: Int = 0, atmosphere: Int = 0) {
      self.food = food
      self.service = service
      self.atmosphere = atmosphere
    }

    public init(from decoder: Decoder) throws {
      let container: KeyedDecodingContainer<PoiModule.Data.Response.HotelRatingBreakdown.CodingKeys> = try decoder.container(keyedBy: PoiModule.Data.Response.HotelRatingBreakdown.CodingKeys.self)
      self.food = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.HotelRatingBreakdown.CodingKeys.food) ?? 0
      self.service = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.HotelRatingBreakdown.CodingKeys.service) ?? 0
      self.atmosphere = try container.decodeIfPresent(Int.self, forKey: PoiModule.Data.Response.HotelRatingBreakdown.CodingKeys.atmosphere) ?? 0
    }
  }

  // MARK: - ReviewForm
  public struct ReviewForm: Codable {
    public let didYouDineInTakeOutOrGetDelivery, whatDidYouGet, howMuchDidYouSpendPerPerson: String
    public let whichDishesDoYouRecommend, canYouSayMoreAboutAnyOfTheseTopics: String?

    public enum CodingKeys: String, CodingKey {
      case didYouDineInTakeOutOrGetDelivery = "Did you dine in, take out, or get delivery?"
      case whatDidYouGet = "What did you get?"
      case howMuchDidYouSpendPerPerson = "How much did you spend per person?"
      case whichDishesDoYouRecommend = "Which dishes do you recommend?"
      case canYouSayMoreAboutAnyOfTheseTopics = "Can you say more about any of these topics?"
    }

    public init(didYouDineInTakeOutOrGetDelivery: String, whatDidYouGet: String, howMuchDidYouSpendPerPerson: String, whichDishesDoYouRecommend: String?, canYouSayMoreAboutAnyOfTheseTopics: String?) {
      self.didYouDineInTakeOutOrGetDelivery = didYouDineInTakeOutOrGetDelivery
      self.whatDidYouGet = whatDidYouGet
      self.howMuchDidYouSpendPerPerson = howMuchDidYouSpendPerPerson
      self.whichDishesDoYouRecommend = whichDishesDoYouRecommend
      self.canYouSayMoreAboutAnyOfTheseTopics = canYouSayMoreAboutAnyOfTheseTopics
    }
  }

}
