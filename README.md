## ModelMe: Using the Kinect as a measurement / body model capture tool

Starting with:
    modelme_client/

## ModelMe Client
### A Tool to take measurements using the Kinect's depth map.

Right now this is just an experiment and a very rudimentary one at that.

### Requirements

Requires the [Link to the Processing home page](http://www.processing.org/ "Processing language and runtime") and [Link to the SimpleOpenNI Google Code site](https://simple-openni.googlecode.com "SimpleOpenNI"). And a running Kinect, obviously.

### Running

If you run the sketch in the Processing IDE while your Kinect is configured and attached, you should be able to click around on the surface of the RGB image and get delta measurements between the current click and the last click printing out in the Processing console.

### Accuracy

It's pretty accurate about 1/4 of the time. The other 3/4 of the time the click probably occurred too far away from a point in the point cloud and you can get wild (sometimes really wild) results. Consider too, since the RGB image is only 640x480 it's a single pixel may cross many different depths.

### Forward Enhancements

1. blink the last point touchedi in the RGB image
2. draw the last line of measurement in the RGB image
3. allow rotating the scene to see 1 and 2 in 3 dimensions
4. output the measurement on the RGB image, not just the console
