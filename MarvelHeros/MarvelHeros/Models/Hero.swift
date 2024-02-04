//
//  Hero.swift
//  MarvelHeros
//


import Foundation

public struct Hero: Codable {
    public let name, realName, team, firstAppearance: String?
    public let createdBy, publisher: String?
    public let imageUrl: String?
    public let bio: String?
    
    private enum CodingKeys: String, CodingKey {
        case name = "name"
        case realName = "realname"
        case team = "team"
        case firstAppearance = "firstappearance"
        case createdBy = "createdby"
        case publisher = "publisher"
        case imageUrl = "imageurl"
        case bio = "bio"
    }
}

public typealias Heroes = [Hero]

extension Hero {
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.name, forKey: .name)
        try container.encode(self.realName, forKey: .realName)
        try container.encode(self.team, forKey: .team)
        try container.encode(self.firstAppearance, forKey: .firstAppearance)
        try container.encode(self.createdBy, forKey: .createdBy)
        try container.encode(self.publisher, forKey: .publisher)
        try container.encode(self.imageUrl, forKey: .imageUrl)
        try container.encode(self.bio, forKey: .bio)
    }
    
    public init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try values.decode(String.self, forKey: .name)
        self.realName = try values.decode(String.self, forKey: .realName)
        self.team = try values.decode(String.self, forKey: .team)
        self.firstAppearance = try values.decode(String.self, forKey: .firstAppearance)
        self.createdBy = try values.decode(String.self, forKey: .createdBy)
        self.publisher = try values.decode(String.self, forKey: .publisher)
        self.imageUrl = try values.decode(String.self, forKey: .imageUrl)
        self.bio = try values.decode(String.self, forKey: .bio)
    }
}
