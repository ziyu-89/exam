import Foundation

struct messageData: Codable{
    var data: data
}
struct data: Codable{
    var items: [items]
}
struct items: Codable{
    var user: user
    var tags: [String]
}
struct user: Codable{
    var nickName: String
    var imageUrl: URL
}
