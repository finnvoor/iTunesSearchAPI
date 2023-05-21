@testable import iTunesSearchAPI
import XCTest

final class iTunesSearchAPITests: XCTestCase {
    func testSearch() async throws {
        let results = try await iTunesSearchAPI.search(term: "jack johnson")
        XCTAssertEqual(results.resultCount, results.results.count)
        XCTAssertGreaterThan(results.resultCount, 0)
    }

    func testSearchLimit() async throws {
        let results = try await iTunesSearchAPI.search(term: "jack johnson", limit: 14)
        XCTAssertEqual(results.resultCount, results.results.count)
        XCTAssertEqual(results.resultCount, 14)
    }

    func testSearchEntity() async throws {
        let results = try await iTunesSearchAPI.search(term: "jack johnson", entity: [.musicVideo])
        XCTAssertEqual(results.resultCount, results.results.count)
        XCTAssertEqual(Set(results.results.map(\.kind)), Set(["music-video"]))
    }

    func testSearchCountry() async throws {
        let results = try await iTunesSearchAPI.search(term: "jack johnson", country: "ca")
        XCTAssertEqual(results.resultCount, results.results.count)
        XCTAssertGreaterThan(results.resultCount, 0)
    }

    func testLookup() async throws {
        let results = try await iTunesSearchAPI.lookup(iTunesID: 6_443_923_358)
        XCTAssertEqual(results.resultCount, results.results.count)
        XCTAssertEqual(results.resultCount, 1)
        let result = results.results[0]
        XCTAssertEqual(result.sellerName, "Detail Technologies B.V.")
        XCTAssertEqual(result.artistID, 1_563_218_361)
        XCTAssertEqual(result.releaseDate, "2022-11-08T08:00:00Z")
    }

    func testLookupBundleID() async throws {
        let results = try await iTunesSearchAPI.lookup(bundleIdentifier: "co.detail.mac")
        XCTAssertEqual(results.resultCount, results.results.count)
        XCTAssertEqual(results.resultCount, 1)
        let result = results.results[0]
        XCTAssertEqual(result.sellerName, "Detail Technologies B.V.")
        XCTAssertEqual(result.artistID, 1_563_218_361)
        XCTAssertEqual(result.releaseDate, "2022-11-08T08:00:00Z")
    }
}
