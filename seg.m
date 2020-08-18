CT = dicomread('C:\Users\sethm\Desktop\CT Lymph Nodes\ABD_LYMPH_001\09-14-2014-ABDLYMPH001-abdominallymphnodes-30274\abdominallymphnodes-26828\1-154.dcm');
boneMask = CT > 200;
lungMask = CT > -50 && lungMask = CT < 200;
skinMask = CT < -1000;
dicomwrite(boneMask, 'bone416.dcm')
dicomwrite(lungMask, 'lung.dcm')
dicomwrite(skinMask, 'skin.dcm')
