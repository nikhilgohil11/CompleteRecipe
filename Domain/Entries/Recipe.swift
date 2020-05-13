import Foundation

public struct Recipe: Codable {
    public let uid: String
    public let image: String
    public let title: String
    public let subtitle: String
    public let type: String
    public let  date : Date
    
    public init(uid: String,
                image: String,
                title: String,
                subtitle: String,
                type: String,
                date: Date) {
        self.uid = uid
        self.image = image
        self.title = title
        self.subtitle = subtitle
        self.type = type
        self.date = date
    }

//    public init(uid: String, image: String, title: String, subtitle: String, type: String) {
//        self.init(uid: uid,
//        image: image,
//        title: title,
//        subtitle: subtitle,
//        type: type,
//        date: Date()
//        )
//    }

    private enum CodingKeys: String, CodingKey {
        case uid
        case image
        case title
        case subtitle
        case type
        case date
    }

    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        uid = try container.decode(String.self, forKey: .uid)
        image = try container.decode(String.self, forKey: .image)
        title = try container.decode(String.self, forKey: .title)
        subtitle = try container.decode(String.self, forKey: .subtitle)
        type = try container.decode(String.self, forKey: .type)
        date = try container.decode(Date.self, forKey: .date)
    }
}

extension Recipe: Equatable {
    public static func == (lhs: Recipe, rhs: Recipe) -> Bool {
            return lhs.uid == rhs.uid &&
                lhs.image == rhs.image &&
                lhs.title == rhs.title &&
                lhs.subtitle == rhs.subtitle &&
                lhs.type == rhs.type &&
                lhs.date == rhs.date
    }
}
