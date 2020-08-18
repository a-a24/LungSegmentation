CT = dicomread('C:\Users\sethm\Desktop\CT Lymph Nodes\ABD_LYMPH_001\09-14-2014-ABDLYMPH001-abdominallymphnodes-30274\abdominallymphnodes-26828\1-416.dcm');

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
skinMask1 = skinMask - boneMask;

%Create dicom files for each mask
dicomwrite(boneMask, 'bone.dcm')
dicomwrite(lungMask, 'lung.dcm')
dicomwrite(skinMask1, 'skin.dcm')
dicomwrite(background, 'background.dcm')
