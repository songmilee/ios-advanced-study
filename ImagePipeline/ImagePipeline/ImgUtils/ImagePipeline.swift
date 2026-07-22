
import Foundation
import UIKit

protocol ImagePipeline {
    func loadImage(with url: URL, size: CGSize) async throws -> UIImage?
}


final class SImagePipeline: ImagePipeline {

    private let imageCache: ImageCache
    private let decoder: ImageDecoder

    init(imageCache: ImageCache, decoder: ImageDecoder) {
        self.imageCache = imageCache
        self.decoder = decoder
    }

    func loadImage(with url: URL, size: CGSize) async throws -> UIImage? {
        if let info = await imageCache.get(for: url) {
            return decoder.decode(data: info.data, size: size)
        }

        return nil
    }
}
