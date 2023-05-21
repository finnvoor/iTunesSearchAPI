public extension iTunesSearchAPI {
    struct Results: Codable {
        public struct Result: Codable, Equatable {
            public let screenshotUrls: [String]?
            public let artworkUrl60: String
            public let artworkUrl512: String?
            public let artworkUrl100: String
            public let artistViewUrl: String?
            public let kind: String
            public let currency: String
            public let minimumOsVersion: String?
            public let trackCensoredName: String
            public let languageCodesISO2A: [String]?
            public let fileSizeBytes: String?
            public let sellerUrl: String?
            public let formattedPrice: String?
            public let contentAdvisoryRating: String?
            public let averageUserRatingForCurrentVersion: Double?
            public let userRatingCountForCurrentVersion: Int?
            public let averageUserRating: Double?
            public let trackViewUrl: String
            public let trackContentRating: String?
            public let releaseNotes: String?
            public let artistId: Int?
            public let artistName: String
            public let genres: [String]?
            public let price: Double?
            public let trackId: Int
            public let trackName: String
            public let description: String?
            public let isVppDeviceBasedLicensingEnabled: Bool?
            public let releaseDate: String
            public let bundleId: String?
            public let primaryGenreName: String
            public let primaryGenreId: Int?
            public let sellerName: String?
            public let currentVersionReleaseDate: String?
            public let genreIds: [String]?
            public let version: String?
            public let wrapperType: String
            public let userRatingCount: Int?

            public static func placeholder() -> Self {
                .init(
                    screenshotUrls: [
                        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource123/v4/d7/21/58/d7215842-da4c-36e2-e018-cac916456f36/ef58ca8e-07c4-4d04-8c93-8f0615d0520f_App_Store_Image_1_-_2560x1600_-_Screenshot_1.png/800x500bb.jpg",
                        "https://is5-ssl.mzstatic.com/image/thumb/PurpleSource123/v4/9b/52/5f/9b525fe4-ea8d-fad3-5135-32c787c609d1/e71b5569-6f7c-429c-bbff-81224d7090e3_App_Store_Image_2_-_2560x1600_-_Screenshot_2.png/800x500bb.jpg",
                        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource123/v4/d5/c2/07/d5c2070c-1778-5f4f-b847-a4b651f9d350/08b8f244-3df8-4de6-9764-f63823280776_App_Store_Image_3_-_2560x1600_-_Screenshot_3.png/800x500bb.jpg",
                        "https://is4-ssl.mzstatic.com/image/thumb/PurpleSource123/v4/76/c7/e6/76c7e65c-cc85-20b4-c953-177b846c0694/f4907e96-5806-47ba-8f46-c8392d56e6fd_App_Store_Image_4_-_2560x1600_-_Screenshot_4.png/800x500bb.jpg",
                        "https://is2-ssl.mzstatic.com/image/thumb/PurpleSource113/v4/1f/1a/f3/1f1af379-19bb-7020-0198-ffe55a5bec25/516bb232-15d0-49ce-b87e-01847361566e_App_Store_Image_5_-_2560x1600__-_Screenshot_5.1.png/800x500bb.jpg",
                        "https://is1-ssl.mzstatic.com/image/thumb/PurpleSource113/v4/2c/a5/5f/2ca55f71-c275-081c-b0d8-bfcf0d468b96/1ef67bc6-83a4-4f63-885b-cc734779c110_App_Store_Image_6__-_2560x1600__-_Screenshot_6.png/800x500bb.jpg"
                    ],
                    artworkUrl60: "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/b6/f2/43/b6f2437f-5d9e-0c16-ee5f-ab25e3d03a99/AppIcon-0-85-220-0-4-2x.png/60x60bb.png",
                    artworkUrl512: "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/b6/f2/43/b6f2437f-5d9e-0c16-ee5f-ab25e3d03a99/AppIcon-0-85-220-0-4-2x.png/512x512bb.png",
                    artworkUrl100: "https://is3-ssl.mzstatic.com/image/thumb/Purple123/v4/b6/f2/43/b6f2437f-5d9e-0c16-ee5f-ab25e3d03a99/AppIcon-0-85-220-0-4-2x.png/100x100bb.png",
                    artistViewUrl: "https://apps.apple.com/us/developer/detail-technologies-b-v/id1563218361?mt=12&uo=4",
                    kind: "mac-software",
                    currency: "USD",
                    minimumOsVersion: "12.3",
                    trackCensoredName: "Detail – Video Studio",
                    languageCodesISO2A: ["EN"],
                    fileSizeBytes: "73402087",
                    sellerUrl: "https://www.detail.co",
                    formattedPrice: "Free",
                    contentAdvisoryRating: "4+",
                    averageUserRatingForCurrentVersion: 0,
                    userRatingCountForCurrentVersion: 0,
                    averageUserRating: 0,
                    trackViewUrl: "https://apps.apple.com/us/app/detail-video-studio/id6443923358?mt=12&uo=4",
                    trackContentRating: "4+",
                    releaseNotes: "Detail 3.8 includes some awesome new features as well as exciting improvements to make your Detail experience better than ever.\n\nWhat’s new:\n- You can now create a new project from any video in your Detail Library\n\nWhat’s improved:\n- The timeline now scrolls horizontally when playing back your video.\n- Record mode is more discoverable.\n- We added a new “Record mode” button so you can easily skip to the end of the timeline and arm Detail for recording.\n- We improved and standardized the canvas menu buttons and tooltips.\n- We added new system tooltips to help you find your way around Detail.\n- You can now cancel uploads from the Detail Library to the web.\n- You can now name your video files during export.\n- We updated the items in the context menu when you right click on a clip.\n\nWhat’s fixed:\n- We fixed a bug where the first marker you added wouldn’t appear.\n- We fixed a bug that meant the total video duration appeared incorrectly when you first opened a project.\n- We fixed a bug that allowed you to scrub an empty part of the timeline.\n- If a project crashes, Detail will show a warning before opening the project again.\n- We’ve improved behavior around deleted projects and Library folders.\n- We fixed a big where incorrect images showed on Scene Packs.",
                    artistId: 1563218361,
                    artistName: "Detail Technologies B.V.",
                    genres: ["Photo & Video"],
                    price: 0,
                    trackId: 6443923358,
                    trackName: "Detail – Video Studio",
                    description: "Record, remix, and share inspiring video in minutes. \n\nDetail turns your M1/M2 Mac into a powerful, all-in-one video production studio. Whether you’re creating an engaging online course, an immersive video podcast, or a polished product demo, Detail makes video production simple for everyone.\n\nShoot Once. Record Everything.\n• Record your camera and screen, or multiple camera angles at the same time, in one take.\n• Connect your iPhone or iPad to instantly upgrade your video, or use any USB camera, capture card, or webcam.\n• When you hit record, Detail captures everything in sync so you never miss a moment.\n\nShoot Once. Remix Everything.\n• Get total flexibility with magic canvas — Seamlessly switch from horizontal to vertical video, or remix your shots to create truly dynamic content.\n• Split, cut and reorder your clips, or swap out a whole scene for a better take.\n\nShoot Once. Share Everywhere.\n• Record horizontal and vertical video at the same time.\n• Turn your long-form content into bitesize, shareable clips with automatic AI-generated video highlights.\n• Easily export videos and clips to share with your audience, your editor or your team.\n\nGet started in seconds.\n• Kickstart your next video with tons of free, customizable templates. \n• Detail works with the camera(s) you already have so all you have to do is hit record.\n\nOne simple app. Everything you need.\n• iOS companion app: With Detail for iOS you can use your iPhone or iPad as a high-quality camera with your Mac. Connect multiple iOS devices over WiFi or USB and use any lens on your device.\n• Make every shot the perfect shot: AI-powered auto framing means the camera stays on you.\n• Live video: Go live on your favorite streaming platform directly from Detail or use Detail as a webcam for work calls, presentations and meetings.\n• Get creative: Bring your videos to life with custom branding. Add titles, text, backgrounds, and images.\n• Plan and produce: Set up your scenes before you record and spend less time on your edit.",
                    isVppDeviceBasedLicensingEnabled: true,
                    releaseDate: "2022-11-08T08:00:00Z",
                    bundleId: "co.detail.mac",
                    primaryGenreName: "Photo & Video",
                    primaryGenreId: 6008,
                    sellerName: "Detail Technologies B.V.",
                    currentVersionReleaseDate: "2023-01-17T17:54:50Z",
                    genreIds: ["6008"],
                    version: "3.8.0",
                    wrapperType: "software",
                    userRatingCount: 0
                )
            }
        }

        public let resultCount: Int
        public let results: [Result]

        public static func placeholder() -> Self {
            .init(resultCount: 1, results: [.placeholder()])
        }
    }
}
