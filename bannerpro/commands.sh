#!/bin/sh
# Script for resizing the image
# Author : vishnu.mohan@inmobi.com

type="`identify $1 | awk -F ' ' '{print $3}'`";

echo $type;
fullName=$(basename "$1");
extension="${fullName##*.}";
folderName="${fullName%.*}";

rm -rf uploads/$folderName;
mkdir -p uploads/$folderName;
cp $1 uploads/$folderName;

isTar=0 ;

# Add the following

if [ `echo $type|grep '960x1280'| wc -l` -eq 1 ];then

	# Make 800x1280 first and then make the remaining sizes
	convert uploads/$folderName/$fullName -gravity center -crop 800x1280+0+0 -quality 85% uploads/$folderName/800x1280.$extension
	
	convert uploads/$folderName/800x1280.$extension -gravity center -crop 720x1280+0+0 -quality 85% uploads/$folderName/720x1280.$extension
	convert uploads/$folderName/720x1280.$extension -resize 640x1138 -quality 85% -gravity center -crop 640x1136+0+0 +repage uploads/$folderName/640x1136.$extension;
	convert uploads/$folderName/640x1136.$extension -resize 320 -quality 85% uploads/$folderName/320x568.$extension;

	#Second part image resizing	
	convert uploads/$folderName/800x1280.$extension -resize 640x1024 -quality 85% -gravity center -crop 640x960+0+0 +repage uploads/$folderName/640x960.$extension;
	convert uploads/$folderName/640x960.$extension -quality 85% -resize 320 uploads/$folderName/320x480.$extension;

	#Third part image resizing
	convert uploads/$folderName/$fullName -quality 85% -resize 768x1024 uploads/$folderName/768x1024.$extension;
	convert uploads/$folderName/$fullName -quality 85% -resize 500x667 -gravity center -crop 500x600+0+0 +repage uploads/$folderName/500x600.$extension;
	convert uploads/$folderName/500x600.$extension -quality 85% -resize 250 uploads/$folderName/250x300.$extension;
	isTar=1;

elif [ `echo $type|grep '1280x720'| wc -l` -eq 1 ];then

	convert uploads/$folderName/$fullName -gravity center -crop 1200x627+0+0 -quality 85% uploads/$folderName/1200x627.$extension
	convert uploads/$folderName/1200x627.$extension -quality 85% -resize 600!x313! uploads/$folderName/600x313.$extension;
	isTar=1;

elif [ `echo $type|grep '800x1280'| wc -l` -eq 1 ];then
	
	convert uploads/$folderName/$fullName -gravity center -crop 720x1280+0+0 -quality 85% uploads/$folderName/720x1280.$extension
	convert uploads/$folderName/720x1280.$extension -resize 640x1138 -quality 85% -gravity center -crop 640x1136+0+0 +repage uploads/$folderName/640x1136.$extension;
	convert uploads/$folderName/640x1136.$extension -resize 320 -quality 85% uploads/$folderName/320x568.$extension;

	#Second part image resizing	
	convert uploads/$folderName/$fullName -resize 640x1024 -quality 85% -gravity center -crop 640x960+0+0 +repage uploads/$folderName/640x960.$extension;
	convert uploads/$folderName/640x960.$extension -quality 85% -resize 320 uploads/$folderName/320x480.$extension;

	#Third part image resizing
	convert uploads/$folderName/$fullName -resize 768x1229 -quality 85% -gravity center -crop 768x1024+0+0 +repage uploads/$folderName/768x1024.$extension;
	convert uploads/$folderName/768x1024.$extension -quality 85% -resize 500x667 -gravity center -crop 500x600+0+0 +repage uploads/$folderName/500x600.$extension;
	convert uploads/$folderName/500x600.$extension -quality 85% -resize 250 uploads/$folderName/250x300.$extension;
	isTar=1;

elif [ `echo $type|grep '1280x800'| wc -l` -eq 1 ];then
	
	convert uploads/$folderName/$fullName -gravity center -crop 1280x720+0+0 -quality 85% uploads/$folderName/1280x720.$extension
	convert uploads/$folderName/1280x720.$extension -resize 1138x640 -quality 85% -gravity center -crop 1136x640+0+0 +repage uploads/$folderName/1136x640.$extension;
	convert uploads/$folderName/1136x640.$extension -resize 568 -quality 85% uploads/$folderName/568x320.$extension;

	#Second part image resizing	
	convert uploads/$folderName/$fullName -resize 1024x640 -quality 85% -gravity center -crop 960x640+0+0 +repage uploads/$folderName/960x640.$extension;
	convert uploads/$folderName/960x640.$extension -quality 85% -resize 480 uploads/$folderName/480x320.$extension;

	#Third part image resizing
	convert uploads/$folderName/$fullName -resize 1229x768 -quality 85% -gravity center -crop 1024x768+0+0 +repage uploads/$folderName/1024x768.$extension;
	convert uploads/$folderName/1024x768.$extension -quality 85% -resize 667x500 -gravity center -crop 600x500+0+0 +repage uploads/$folderName/600x500.$extension;
	convert uploads/$folderName/600x500.$extension -quality 85% -resize 300 uploads/$folderName/300x250.$extension;

	isTar=1;

elif [ `echo $type|grep '1280x960'| wc -l` -eq 1 ];then

	convert uploads/$folderName/$fullName -quality 85% -resize 1200x900 -gravity center -crop 1200x627+0+0 +repage uploads/$folderName/1200x627.$extension;
	convert uploads/$folderName/1200x627.$extension -resize 600!x313! -quality 85% uploads/$folderName/600x313.$extension >> test.log;

	#Create 1280x800 images first
	convert uploads/$folderName/$fullName -gravity center -crop 1280x800+0+0 -quality 85% uploads/$folderName/1280x800.$extension

	convert uploads/$folderName/1280x800.$extension -gravity center -crop 1280x720+0+0 -quality 85% uploads/$folderName/1280x720.$extension
	convert uploads/$folderName/1280x720.$extension -resize 1138x640 -quality 85% -gravity center -crop 1136x640+0+0 +repage uploads/$folderName/1136x640.$extension;
	convert uploads/$folderName/1136x640.$extension -resize 568 -quality 85% uploads/$folderName/568x320.$extension;

	#Second part image resizing	
	convert uploads/$folderName/1280x800.$extension -resize 1024x640 -quality 85% -gravity center -crop 960x640+0+0 +repage uploads/$folderName/960x640.$extension;
	convert uploads/$folderName/960x640.$extension -quality 85% -resize 480 uploads/$folderName/480x320.$extension;

	#Third part image resizing
	convert uploads/$folderName/$fullName -quality 85% -resize 1024x768 uploads/$folderName/1024x768.$extension;
	convert uploads/$folderName/$fullName -quality 85% -resize 667x500 -gravity center -crop 600x500+0+0 +repage uploads/$folderName/600x500.$extension;
	convert uploads/$folderName/600x500.$extension -quality 85% -resize 300 uploads/$folderName/300x250.$extension;

	isTar=1;

elif [ `echo $type|grep '1200x627'| wc -l` -eq 1 ];then
	
	convert uploads/$folderName/$fullName -resize 600!x313! -quality 85% uploads/$folderName/600x313.$extension >> test.log;

elif [ `echo $type|grep '627x1200'| wc -l` -eq 1 ];then
	
	convert uploads/$folderName/$fullName -resize 313!x600! -quality 85% uploads/$folderName/313x600.$extension >> test.log;

elif [ `echo $type|grep '640x100'| wc -l` -eq 1 ];then
	
	convert uploads/$folderName/$fullName -resize 320x50 -quality 85% uploads/$folderName/320x50.$extension >> test.log;

elif [ `echo $type|grep '100x640'| wc -l` -eq 1 ];then
	
	convert uploads/$folderName/$fullName -resize 50x320 -quality 85% uploads/$folderName/50x320.$extension >> test.log;

elif [ `echo $type|grep '600x100'| wc -l` -eq 1 ];then
	
	convert uploads/$folderName/$fullName -resize 300x50 -quality 85% uploads/$folderName/300x50.$extension >> test.log;
	convert uploads/$folderName/$fullName -resize 216x36 -quality 85% uploads/$folderName/216x36.$extension >> test.log;
	isTar=1;

elif [ `echo $type|grep '100x600'| wc -l` -eq 1 ];then
	
	convert uploads/$folderName/$fullName -resize 50x300 -quality 85% uploads/$folderName/50x300.$extension >> test.log;
	convert uploads/$folderName/$fullName -resize 36x216 -quality 85% uploads/$folderName/36x216.$extension >> test.log;
	isTar=1;

elif [ `echo $type|grep '728x90'| wc -l` -eq 1 ];then
	
	convert uploads/$folderName/$fullName -resize 468!x58! -quality 85% uploads/$folderName/468x58.$extension >> test.log;
	convert uploads/$folderName/$fullName -resize 468!x60! -quality 85% uploads/$folderName/468x60.$extension >> test.log;
	isTar=1;

elif [ `echo $type|grep '90x728'| wc -l` -eq 1 ];then
	
	convert uploads/$folderName/$fullName -resize 58!x468! -quality 85% uploads/$folderName/58x468.$extension >> test.log;
	convert uploads/$folderName/$fullName -resize 60!x468! -quality 85% uploads/$folderName/60x468.$extension >> test.log;
	isTar=1;

elif [ `echo $type|grep '728x100'| wc -l` -eq 1 ];then

		convert uploads/$folderName/$fullName -gravity center -crop 640x100+0+0 -quality 85% uploads/$folderName/640x100.$extension >> test.log;
		convert uploads/$folderName/$fullName -gravity center -crop 600x100+0+0 -quality 85% uploads/$folderName/600x100.$extension
		convert uploads/$folderName/600x100.$extension -resize 300x50 -quality 85% uploads/$folderName/300x50.$extension >> test.log;
		convert uploads/$folderName/640x100.$extension -resize 320x50 -quality 85% uploads/$folderName/320x50.$extension >> test.log;
		convert uploads/$folderName/320x50.$extension -resize 320!x48! -quality 85% uploads/$folderName/320x48.$extension >> test.log;
		convert uploads/$folderName/300x50.$extension -resize 216x36 -quality 85% uploads/$folderName/216x36.$extension >> test.log;
		convert uploads/$folderName/216x36.$extension -resize 120x20 -quality 85% uploads/$folderName/120x20.$extension >> test.log;

		convert uploads/$folderName/$fullName -gravity center -crop 728x90+0+0 -quality 85% uploads/$folderName/728x90.$extension >> test.log;
		convert uploads/$folderName/728x90.$extension -resize 468!x60! -quality 85% uploads/$folderName/468x60.$extension >> test.log;

		isTar=1;
elif [ `echo $type|grep '620x600'| wc -l` -eq 1 ];then
		convert uploads/$folderName/$fullName -quality 85% -gravity center -crop 620x532+0+0 -resize 310x266 +repage uploads/$folderName/310x266.$extension;
		convert uploads/$folderName/310x266.$extension -gravity center -crop 310x144+0+0 -quality 85% uploads/$folderName/310x144.$extension
		convert uploads/$folderName/310x266.$extension -gravity center -crop 310x206+0+0 -quality 85% uploads/$folderName/310x206.$extension
		convert uploads/$folderName/$fullName -quality 85% -resize 378x366 -gravity center -crop 300x366+0+0 +repage uploads/$folderName/300x366.$extension;
		convert uploads/$folderName/$fullName -gravity center -crop 600x600+0+0 -quality 85% uploads/$folderName/600x600.$extension;
		
		isTar=1;

elif [ `echo $type|grep '600x600'| wc -l` -eq 1 ];then
		convert uploads/$folderName/$fullName -resize 300x300 -quality 85% uploads/$folderName/300x300.$extension;
		convert uploads/$folderName/$fullName -resize 150x150 -quality 85% uploads/$folderName/150x150.$extension;
		convert uploads/$folderName/$fullName -resize 75x75 -quality 85% uploads/$folderName/75x75.$extension;
		isTar=1;
fi;

if [ $isTar -eq 1 ];then

	cd uploads;
	tar -czf $folderName\_resized.tgz $folderName >> test.log;
	#zip $folderName\_resized $folderName;
	rm -rf $folderName;
	cd ..;
fi;