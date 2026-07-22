
import Foundation

protocol ImageCache {
    func get(for url: URL) async -> ImageInfo?
    func save(_ imageInfo: ImageInfo)
}


final class SImageCache: ImageCache {
    private var cache: NSCache<NSString, ImageInfo>
    private let apiClient: ImageApiClient

    init(apiClient: ImageApiClient) {
        self.apiClient = apiClient
        self.cache = .init()
        self.cache.countLimit = 100
    }

    func get(for url: URL) async -> ImageInfo? {
        let key = NSString(string: url.absoluteString)
        if let imgInfo = cache.object(forKey: key) {
            return imgInfo
        }

        do {
            if let data = try await apiClient.requestImage(from: url) {
                let imgInfo = ImageInfo(url: url, data: data)
                save(imgInfo)

                return imgInfo
            }
        } catch {
            return nil
        }

        return nil
    }
    
    func save(_ imageInfo: ImageInfo) {
        let key = NSString(string: imageInfo.url.absoluteString)
        cache.setObject(imageInfo, forKey: key)
    }
}
