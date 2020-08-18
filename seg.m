CT = dicomread('C:\Users\sethm\Desktop\CT Lymph Nodes\ABD_LYMPH_001\09-14-2014-ABDLYMPH001-abdominallymphnodes-30274\abdominallymphnodes-26828\1-154.dcm');
boneMask = CT > 200;
lungMask = CT > 0;
lungMask1 = lungMask-boneMask;
background = CT < -800; 
skinMask1 = skinMask - boneMask;
dicomwrite(boneMask, 'bone.dcm')
dicomwrite(lungMask, 'lung.dcm')
dicomwrite(skinMask1, 'skin.dcm')
dicomwrite(background, 'background.dcm')
