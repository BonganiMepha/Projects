//
//  File.swift
//  BreakingBadApi
//
//  Created by bongani vincent mepha on 2022/08/06.
//

import Foundation

protocol CharacterSummary {
    var id: Int { get }
    var name: String { get }
    var nickname: String { get }
    var birthDayDetail : String?  { get }
    var imageURLString: String { get }
}

protocol ExtendedCharacterInformation: CharacterSummary {
    var occupationString: String? { get }
    var portrayed: String { get }
    var status: String { get }
}

struct Character: Codable, CharacterSummary, ExtendedCharacterInformation {
    var id: Int
    
    var status: String
    
    var occupationString: String? {
        return self.occupation.joined(separator: ",")
    }

//    var occupationString: String? {
//  return occupation.flatmap {$0}
//    }()
    
    var occupation: [String]
    var protrayed: String
    
    let name: String
    let birthday: String
    let ImageURLString: String
    let nickname: String
    
    private var birthDate: Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-DD"
        guard let birthDate = dateFormatter.date(from: self.birthday) else {
            return nil
        }
        
        return birthDate
    }
    
    private var age: String {
        // calculates the age from current date
        
        let calendar = NSCalendar.current
        
        guard let birthDate = self.birthDate else {
            return "0"
        }
       
        let ageComponents = calender.dateComponents([.year], from: birthDate, to: Date())
        
        guard let ageInYears = ageComponents.year else {
            return "0"
        }
        return "\(ageInYears)"
    }
    
    private func birthdayStringInCorrectFormat() -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-mm-dd"
        guard let birthDate = self.birthDate else {
            return nil
        }
        return dateFormatter.string(from: birthDate)
    }
    var birthDateDetail: String? {
        if birthday.lowercased() == "unknown" {
            return "-"
        }
        if let unwrappedBirthDayString = birthdayStringInCorrectFormat() {
            return "\(unwrappedBirthDayString) (\(age))"
        }
        return ","
    }
    enum CodingKeys: String, CodingKey {
        case name, nickname, occupation, portrayed, status
        case id = "char_id"
        case imageURLString = "img"
    
    }

}



