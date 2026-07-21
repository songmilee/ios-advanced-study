
import Foundation
import UIKit

protocol ImageDecoder {
    func decode(data: Data, size: CGSize) -> UIImage?
}
