function [ output_args ] = realTime( directory,distinct,image_dir )
%Creates a Training Basis exclusive DATA only. This is called by Visual
%Studio in order to have nearly real time gesture recognition.
    image_dir = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\Gestures_Images';
    directory = 'C:\Users\Beverly\Documents\GitHub\Hand_Gesture_Recognition\All_Data';
    if (distinct == 5)
        % Basis of 5 different gestures 
        group = ['fist   ';'middle ';'pinky  ';'pointer';'thumb  '];    
    end %else specify and hardcode gestures
   
    [basis,total_basis_subjects,ROW,COL] = oneDirBasis(directory,distinct,18);
    %Output Recognition Results
    class = knnclassify(sample,basis,group,1);
    imshow(dir(fullfile(image_dir).class));



end

