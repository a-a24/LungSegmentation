CT = dicomread('C:\Users\sethm\Desktop\4D-Lung\100_HM10395\09-16-1997-p4-16843\505.000000-P4P100S101I0 Gated 50.0-72530\1-50');

%Segment the bones
boneMask = CT > 200;

%Segment the lungs and subtract the bones
lungMask = CT > 0;
lungMask = lungMask-boneMask;
lungMask = logical(lungMask);

%Segment the background
background = CT < -800; 

%Segment the skin by subtracting the bones, lungs, and background from the
%entire image
maxValue = max(CT(:));
image = CT <= maxValue;
skinMask = image - boneMask - background; 
skinMask = logical(skinMask);


%Create dicom files for each mask
dicomwrite(boneMask, 'bone.dcm')
dicomwrite(lungMask, 'lung.dcm')
dicomwrite(skinMask, 'skin.dcm')
dicomwrite(background, 'background.dcm')
