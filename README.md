# Hand_Gesture_Recognition
This calls knnclassify on MATLAB and organizes data from Virtual Motion Labs' Data Glove Lite.

The goal of this project is to test the robustness of k-nearest-neighbor algorithm and discover how the
training basis, the quantity of samples, and the relationship of finger flexibility and hand rotation affect
the accuracy of gesture recognition.

The 8 values can be seen throughout All_Data. FN shows the percentage that a finger bends, meaning that 100 corresponds to a finger being fully bent and 0 corresponds to a finger being open and at rest. 

F1 = pinky, F2 = ring, F3 = middle, F4 = pointer, F5 = thumb

ROLL = rotation along fingertips, PITCH = rotation along outer sides of fingers, YAW = rotation along palm

There are 5 static gestures and 18 volunteers for this project.
The 5 distinct, static gestures tested are the formations of a fist, and the protrusion of the middle, pointer, pinky, or thumb finger.
Each gesture contributed by each volunteer technically contributes to 98 samples of that specific gesture because the movement are independent to time. 

This will change for dynamic gestures, which have not yet been tested. 

The two main files are knn_accuracy.m (subject inclusive) and knn_accuracy_exclusive_sample.m (subject exclusive). Both call the intermediate functions in this repository. 

