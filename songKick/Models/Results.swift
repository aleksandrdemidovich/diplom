//
//  Results.swift
//  songKick
//
//  Created by Denys White on 12/28/18.
//  Copyright © 2018 Denys White. All rights reserved.
//

import Foundation

enum Results {
    case artist([Artist])
    case event([Event])
    case unsupported
}

extension Results: Codable {

    private enum ApiType: String, CodingKey {
        case artist
        case event
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ApiType.self)
        self = .unsupported

        for key in container.allKeys{
            switch key.stringValue {
            case ApiType.artist.rawValue:
                let value = try container.decode([Artist].self, forKey: .artist)
                self = .artist(value)
            case ApiType.event.rawValue:
                let value = try container.decode([Event].self, forKey: .event)
                self = .event(value)
            default:
                self = .unsupported
            }
        }
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: ApiType.self)
        switch self {
        case .artist(let res):
            try container.encode(res, forKey: .artist)
        case .event(let res):
            try container.encode(res, forKey: .event)
        case .unsupported:
            let context = EncodingError.Context(codingPath: [], debugDescription: "Invalid attachment.")
            throw EncodingError.invalidValue(self, context)
        }
    }
}
