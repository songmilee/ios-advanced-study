
import Foundation

protocol ImageCache {
    func get(for url: String) async -> ImageInfo?
    func save(_ imageInfo: ImageInfo)
}
