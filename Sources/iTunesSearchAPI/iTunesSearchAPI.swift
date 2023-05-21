import Foundation

/// The Search API allows you to search for content within the iTunes Store, App Store, iBooks Store and Mac App Store. You can search for a variety of content; including apps, iBooks, movies, podcasts, music, music videos, audiobooks, and TV shows. You can also call an ID-based lookup request.
public enum iTunesSearchAPI {
    public enum Media: String {
        case movie, podcast, music, musicVideo, audiobook, shortFilm, tvShow, software, ebook, all

        // MARK: Internal

        var allowedEntities: [Entity] {
            switch self {
            case .movie: return [.movieArtist, .movie]
            case .podcast: return [.podcastAuthor, .podcast]
            case .music: return [.musicArtist, .musicTrack, .album, .musicVideo, .mix, .song]
            case .musicVideo: return [.musicArtist, .musicVideo]
            case .audiobook: return [.audiobookAuthor, .audiobook]
            case .shortFilm: return [.shortFilmArtist, .shortFilm]
            case .tvShow: return [.tvEpisode, .tvSeason]
            case .software: return [.software, .iPadSoftware, .macSoftware]
            case .ebook: return [.ebook]
            case .all: return [.movie, .album, .allArtist, .podcast, .musicVideo, .mix, .audiobook, .tvSeason, .allTrack]
            }
        }

        var allowedAttributes: [Attribute] {
            switch self {
            case .movie: return [.actorTerm, .genreIndex, .artistTerm, .shortFilmTerm, .producerTerm, .ratingTerm, .directorTerm, .releaseYearTerm, .featureFilmTerm, .movieArtistTerm, .movieTerm, .ratingIndex, .descriptionTerm]
            case .podcast: return [.titleTerm, .languageTerm, .authorTerm, .genreIndex, .artistTerm, .ratingIndex, .keywordsTerm, .descriptionTerm]
            case .music: return [.mixTerm, .genreIndex, .artistTerm, .composerTerm, .albumTerm, .ratingIndex, .songTerm]
            case .musicVideo: return [.genreIndex, .artistTerm, .albumTerm, .ratingIndex, .songTerm]
            case .audiobook: return [.titleTerm, .authorTerm, .genreIndex, .ratingIndex]
            case .shortFilm: return [.genreIndex, .artistTerm, .shortFilmTerm, .ratingIndex, .descriptionTerm]
            case .tvShow: return [.genreIndex, .tvEpisodeTerm, .showTerm, .tvSeasonTerm, .ratingIndex, .descriptionTerm]
            case .software: return [.softwareDeveloper]
            case .ebook: return []
            case .all: return [.actorTerm, .languageTerm, .allArtistTerm, .tvEpisodeTerm, .shortFilmTerm, .directorTerm, .releaseYearTerm, .titleTerm, .featureFilmTerm, .ratingIndex, .keywordsTerm, .descriptionTerm, .authorTerm, .genreIndex, .mixTerm, .allTrackTerm, .artistTerm, .composerTerm, .tvSeasonTerm, .producerTerm, .ratingTerm, .songTerm, .movieArtistTerm, .showTerm, .movieTerm, .albumTerm]
            }
        }
    }

    public enum Entity: String {
        case movieArtist
        case movie
        case podcastAuthor
        case podcast
        case musicArtist
        case musicTrack
        case album
        case musicVideo
        case mix
        case song
        case audiobookAuthor
        case audiobook
        case shortFilmArtist
        case shortFilm
        case tvEpisode
        case tvSeason
        case software
        case iPadSoftware
        case macSoftware
        case ebook
        case allArtist
        case allTrack
    }

    public enum Attribute: String {
        case actorTerm
        case genreIndex
        case artistTerm
        case shortFilmTerm
        case producerTerm
        case ratingTerm
        case directorTerm
        case releaseYearTerm
        case featureFilmTerm
        case movieArtistTerm
        case movieTerm
        case ratingIndex
        case descriptionTerm
        case titleTerm
        case languageTerm
        case authorTerm
        case keywordsTerm
        case mixTerm
        case composerTerm
        case albumTerm
        case songTerm
        case softwareDeveloper
        case tvEpisodeTerm
        case showTerm
        case tvSeasonTerm
        case allArtistTerm
        case allTrackTerm
    }

    public enum Error: Swift.Error, LocalizedError {
        case entityNotAllowed
        case attributeNotAllowed
        case limitOutOfRange

        // MARK: Public

        public var errorDescription: String? {
            switch self {
            case .entityNotAllowed: return "Entity not allowed for specified media type"
            case .attributeNotAllowed: return "Attribute not allowed for specified media type"
            case .limitOutOfRange: return "Limit outside of allowed range (1-200)"
            }
        }
    }

    /// Search for content within the iTunes Store, App Store, iBooks Store and Mac App Store. You can search for a variety of content;
    /// including apps, iBooks, movies, podcasts, music, music videos, audiobooks, and TV shows.
    /// - Parameters:
    ///   - term: The URL-encoded text string you want to search for. For example: jack+johnson.
    ///   - country: The two-letter country code for the store you want to search. The search uses the default store front for the specified country. For example: US. The default is US.
    ///   - media: The media type you want to search for. For example: movie. The default is all.
    ///   - entity: The type of results you want returned, relative to the specified media type. For example: movieArtist for a movie media type search. The default is the track entity associated with the specified media type.
    ///   - attribute: The attribute you want to search for in the stores, relative to the specified media type. For example, if you want to search for an artist by name specify `entity=allArtist&attribute=allArtistTerm`. In this example, if you search for `term=maroon`, iTunes returns “Maroon 5” in the search results, instead of all artists who have ever recorded a song with the word “maroon” in the title. The default is all attributes associated with the specified media type.
    ///   - limit: The number of search results you want the iTunes Store to return. For example: 25. The default is 50.
    ///   - explicit: The language, English or Japanese, you want to use when returning search results. Specify the language using the five-letter codename. For example: `en_us`. The default is `en_us` (English).
    /// - Returns: An ``iTunesSearchAPI.Results`` object
    public static func search(
        term: String,
        country: String? = nil,
        media: Media? = nil,
        entity: [Entity] = [],
        attribute: Attribute? = nil,
        limit: Int? = nil,
        explicit: Bool? = nil
    ) async throws -> Results {
        let baseURL = URL(string: "https://itunes.apple.com/search")!
        let sanitizedTerm = term
            .replacingOccurrences(of: " ", with: "+")
            .addingPercentEncoding(withAllowedCharacters: .alphanumerics.union(CharacterSet(charactersIn: "+.-_*")))
        var queryItems = [URLQueryItem(name: "term", value: sanitizedTerm)]
        if let country {
            queryItems.append(URLQueryItem(name: "country", value: country))
        }
        if let media {
            queryItems.append(URLQueryItem(name: "media", value: media.rawValue))
        }
        if !entity.isEmpty {
            guard media == nil || Set(media!.allowedEntities).subtracting(Set(entity)).isEmpty else {
                throw Error.entityNotAllowed
            }
            queryItems.append(URLQueryItem(
                name: "entity",
                value: entity.map(\.rawValue).joined(separator: ",")
            )
            )
        }
        if let attribute {
            guard media == nil || media!.allowedAttributes.contains(attribute) else { throw Error.attributeNotAllowed }
            queryItems.append(URLQueryItem(name: "attribute", value: attribute.rawValue))
        }
        if let limit {
            guard (1...200).contains(limit) else { throw Error.limitOutOfRange }
            queryItems.append(URLQueryItem(name: "limit", value: "\(limit)"))
        }
        if let explicit {
            queryItems.append(URLQueryItem(name: "explicit", value: explicit ? "Yes" : "No"))
        }
        let searchURL = baseURL.appending(queryItems: queryItems)
        let (data, _) = try await URLSession.shared.data(from: searchURL)
        return try JSONDecoder().decode(Results.self, from: data)
    }

    /// Search for content in the stores based on an iTunes ID
    /// - Parameter iTunesID: The iTunes ID to lookup.
    /// - Returns: An ``iTunesSearchAPI.Results`` object
    public static func lookup(iTunesID: Int) async throws -> Results {
        try await lookup(iTunesIDs: [iTunesID])
    }

    /// Search for content in the stores based on iTunes IDs
    /// - Parameter iTunesIDs: The iTunes IDs to lookup.
    /// - Returns: An ``iTunesSearchAPI.Results`` object
    public static func lookup(iTunesIDs: [Int]) async throws -> Results {
        try await withThrowingTaskGroup(of: Results.self) { group in
            for offset in stride(from: 0, to: iTunesIDs.count, by: 200) {
                group.addTask {
                    let baseURL = URL(string: "https://itunes.apple.com/lookup")!
                    let ids = Array(iTunesIDs[offset..<Swift.min(offset + 200, iTunesIDs.count)])
                    let queryItems = [
                        URLQueryItem(name: "id", value: ids.map(String.init).joined(separator: ",")),
                        URLQueryItem(name: "requestTime", value: String(Date().timeIntervalSince1970))
                    ]
                    let lookupURL = baseURL.appending(queryItems: queryItems)
                    let (data, _) = try await URLSession.shared.data(from: lookupURL)
                    return try JSONDecoder().decode(Results.self, from: data)
                }
            }
            var results: [Results.Result] = []
            for try await result in group { results.append(contentsOf: result.results) }
            return Results(resultCount: results.count, results: results)
        }
    }

    /// Search for content in the stores based on Bundle identifier
    /// - Parameter bundleID: The Bundle ID to lookup.
    /// - Returns: An ``iTunesSearchAPI.Results`` object
    public static func lookup(bundleIdentifier: String) async throws -> Results {
        let baseURL = URL(string: "https://itunes.apple.com/lookup")!
        let queryItems = [
            URLQueryItem(name: "bundleId", value: bundleIdentifier),
            URLQueryItem(name: "requestTime", value: String(Date().timeIntervalSince1970))
        ]
        let lookupURL = baseURL.appending(queryItems: queryItems)
        let (data, _) = try await URLSession.shared.data(from: lookupURL)
        return try JSONDecoder().decode(Results.self, from: data)
    }
}
