
import Foundation
import UIKit

protocol ImagePipeline {
    func loadImage(with url: String) async throws -> UIImage
}


