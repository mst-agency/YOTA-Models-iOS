//
//  Profile.swift
//  
//
//  Created by Anton on 06.09.2020.
//

import Foundation

public struct Profile: Codable {
    public let finblock: Bool
    public let phoneNumber: PhoneNumber
    public let options: Options
    public let pricePerMinute: Float
    public let nextPaymentDate: Int // TimeInterval
    public let availableMinutes: Accumulator
    public let availableGigabytes: Accumulator
    public let possibleMinutes: [PossibleValues]
    public let possibleGigabytes: [PossibleValues]
    public let plannedTariff: PlannedTariff

    public init (finblock: Bool,
                 phoneNumber: PhoneNumber,
                 options: Options,
                 pricePerMinute: Float,
                 nextPaymentDate: Int,
                 availableMinutes: Accumulator,
                 availableGigabytes: Accumulator,
                 possibleMinutes: [PossibleValues],
                 possibleGigabytes: [PossibleValues],
                 plannedTariff: PlannedTariff) {
        self.finblock = finblock
        self.phoneNumber = phoneNumber
        self.options = options
        self.pricePerMinute = pricePerMinute
        self.nextPaymentDate = nextPaymentDate
        self.availableMinutes = availableMinutes
        self.availableGigabytes = availableGigabytes
        self.possibleMinutes = possibleMinutes
        self.possibleGigabytes = possibleGigabytes
        self.plannedTariff = plannedTariff
    }
}

public struct PhoneNumber: Codable {
    public let numberString: String
    public let numberChangeAllowed: Bool

    public init (numberString: String,
                 numberChangeAllowed: Bool) {
        self.numberString = numberString
        self.numberChangeAllowed = numberChangeAllowed
    }
}

public struct Options: Codable {
    public let sms: OptionProperties
    public let vk: OptionProperties
    public let fb: OptionProperties
    public let insta: OptionProperties
    public let youtube: OptionProperties
    public let skype: OptionProperties
    public let twitter: OptionProperties
    public let ok: OptionProperties
    public let whatsapp: OptionProperties
    public let viber: OptionProperties

    public init(sms: OptionProperties,
         vk: OptionProperties,
         fb: OptionProperties,
         insta: OptionProperties,
         youtube: OptionProperties,
         skype: OptionProperties,
         twitter: OptionProperties,
         ok: OptionProperties,
         whatsapp: OptionProperties,
         viber: OptionProperties) {
        self.sms = sms
        self.vk = vk
        self.fb = fb
        self.insta = insta
        self.youtube = youtube
        self.skype = skype
        self.twitter = twitter
        self.ok = ok
        self.whatsapp = whatsapp
        self.viber = viber
    }
}

public struct OptionProperties: Codable {
    public let enabled: Bool
    public let price: Int

    public init(enabled: Bool,
                price: Int) {
        self.enabled = enabled
        self.price = price
    }
}

public struct Accumulator: Codable {
    public let currentVolume: Int?
    public let fullVolume: Int?
    public let isInfinity: Bool?

    public init(currentVolume: Int? = nil,
                fullVolume: Int? = nil,
                isInfinity: Bool? = nil) {
        self.currentVolume = currentVolume
        self.fullVolume = fullVolume
        self.isInfinity = isInfinity
    }
}

public struct PossibleValues: Codable {
    public let rangeWithFormula: RangeWithFormula?
    public let fixValueWithPrice: FixValueWithPrice?

    public init(rangeWithFormula: RangeWithFormula? = nil,
                fixValueWithPrice: FixValueWithPrice? = nil) {
        self.rangeWithFormula = rangeWithFormula
        self.fixValueWithPrice = fixValueWithPrice
    }
}

public struct RangeWithFormula: Codable {
    public let initialValue: Int
    public let endValue: Int
    public let formula: String

    public init(initialValue: Int,
                endValue: Int,
                formula: String) {
        self.initialValue = initialValue
        self.endValue = endValue
        self.formula = formula
    }
}

public struct FixValueWithPrice: Codable {
    public let value: Int?
    public let infinity: Bool?
    public let price: Int

    public init(value: Int? = nil,
                infinity: Bool? = nil,
                price: Int) {
        self.value = value
        self.infinity = infinity
        self.price = price
    }
}

public struct PlannedTariff: Codable {
    public let options: Options
    public let minutes: FixValueWithPrice
    public let gigabytes: FixValueWithPrice

    public init (options: Options,
                 minutes: FixValueWithPrice,
                 gigabytes: FixValueWithPrice) {
        self.options = options
        self.minutes = minutes
        self.gigabytes = gigabytes
    }
}
