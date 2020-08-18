CT = dicomread('C:\Users\sethm\Desktop\CT Lymph Nodes\ABD_LYMPH_001\09-14-2014-ABDLYMPH001-abdominallymphnodes-30274\abdominallymphnodes-26828\1-416.dcm');
boneMask = CT > 200;
lungMask = CT > -50;
skinMask = CT > 0;
skinMask1 = skinMask - boneMask;
dicomwrite(boneMask, 'bone416.dcm')
dicomwrite(lungMask, 'lung.dcm')
dicomwrite(skinMask1, 'skin.dcm')
