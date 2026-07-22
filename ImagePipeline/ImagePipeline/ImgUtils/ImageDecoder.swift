
import Foundation
import UIKit

protocol ImageDecoder {
    func decode(data: Data, size: CGSize) -> UIImage?
}

final class SImageDecoder: ImageDecoder {
    func decode(data: Data, size: CGSize) -> UIImage? {
        let img = UIImage(data: data)

        let renderer = UIGraphicsImageRenderer(size: size)
        let image = renderer.image { _ in
            img?.draw(in: .init(origin: .zero, size: size))
        }
        
        return image
    }
}
