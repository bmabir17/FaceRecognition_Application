package core_recognition;

import static org.bytedeco.javacpp.opencv_core.*;
import static org.bytedeco.javacpp.opencv_imgproc.*;
import static org.bytedeco.javacpp.opencv_highgui.*;

public class SampleCV {
    public static void smooth(String filename) { 
        IplImage image = cvLoadImage(filename);
        if (image != null) {
            cvSmooth(image, image);
            cvSaveImage(filename, image);
            cvReleaseImage(image);
            System.out.println("process is done");
        }else{
        	System.err.println("Could not load file");
        }
    }
    public static void main(String[] args) {
		// TODO Auto-generated method stub
    	smooth("test.png");
    	/* IplImage image = cvLoadImage("test.png", 1);
         if (image == null) {
             System.err.println("Could not load image file.");
         } else {
             cvSmooth(image, image, CV_GAUSSIAN, 3, 0, 0, 0);
             System.out.println("process is done");
             // ...
         }
         */
	}
}
