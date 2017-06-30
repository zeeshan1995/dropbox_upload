time=`cat previousUploadTime.txt`
now=`date +%s`
let min="($time - $now - 60) / 60"

find /home/zeeshan/project/ -user $USER -mmin $min | sed -e '/.git/d' -e '/.swp$/d' -e '/out$/d' -e '/o$/d' > input.txt

if [ $? -ne 0 ];then
				error=true
fi

cat input.txt | sed -e 's/\/home\/zeeshan//'> output.txt
if [ $? -ne 0 ];then
				error=true
fi

python upload.py

if [ $? -ne 0 ];then
				error=true
fi

if [ "$error" = true ];then 
	echo Upload Error
else
	date +%s > previousUploadTime.txt
	echo Upload Successfull
fi
