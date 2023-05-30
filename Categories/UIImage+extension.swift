//
//  UIImage+extension.swift
//  Uninn
//



import Foundation
public extension UIImage {
    class func image(color:UIColor)-> UIImage{
        let rect = CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 59)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let  image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        return image
    }
    
    class func imageUserToCompressForSizeImage(image:UIImage,size:CGSize) -> UIImage {
        let newImage:UIImage!
        let originalSize = image.size
        let originalWidth = originalSize.width
        let originalHeight = originalSize.height
        if originalWidth <= size.width && originalHeight <= originalSize.height {
            newImage = image
        } else {
            let scale = Float(size.width/originalWidth) < Float(size.height/originalHeight) ? Float(size.width/originalWidth) : Float(size.height/originalHeight)
            let newImageSize = CGSize.init(width: Double(scale) * Double(originalWidth) , height: Double(scale) * Double(originalHeight))
            UIGraphicsBeginImageContextWithOptions(CGSize.init(width: newImageSize.width, height: newImageSize.height), false, 0);
            image.draw(in: CGRect.init(x: 0, y: 0, width: newImageSize.width, height: newImageSize.height), blendMode: .normal, alpha: 1.0)
            newImage = UIGraphicsGetImageFromCurrentImageContext()
            if newImage == nil {
                print("iamge")
            }
            UIGraphicsEndImageContext();

        }
        
        return newImage
    }
    
    
      class func scaleFixedSizeForImage(sourceImage:UIImage) -> UIImage {
        
        var width = sourceImage.size.width
        var height = sourceImage.size.height
        var rate = 0.0
        let scaleSideLength = 720.0
        var bScale = false
        var scaledImage = sourceImage
        
        if height > width && Float(width) >= Float(scaleSideLength) {
            rate = Double(scaleSideLength) / Double(width)
            width = CGFloat(scaleSideLength)
            height = CGFloat(Double(width) * rate) 
            bScale = true
        } else if width > height && Float(height) >= Float(scaleSideLength) {
            
            rate = Double(scaleSideLength) / Double(height)
            height = CGFloat(scaleSideLength);
            width = CGFloat(Double(width) * rate)
            bScale = true;
        }
        
        if bScale {
            UIGraphicsBeginImageContextWithOptions(CGSize.init(width: width, height: height), true, 1.0)
            //Draws a rect for the image
            sourceImage.draw(in: CGRect.init(x: 0, y: 0, width: width, height: height))
            //We set the scaled image from the context
            scaledImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext();
        }
        return scaledImage
    }
}
























