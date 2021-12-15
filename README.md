killall -9 python3
killall -9 python3
killall -9 python3

sleep 2
# input file of hostnames/path not http or https
for i in `cat $1`
do
echo URL: $i

rm -Rf headers-large_SPLIT*#
# split up the headers into 69 line files
split -l 69 headers-large.txt headers-large_SPLITa


# for each split run http https and https :8080 for each ... maybe add login.jsp too ?? (python seems to follow redirects so you should not need http  or path if server redirects 80 to 443 /SSL 
for j in `ls headers-large_SPLIT*`
do

# echo Prepending required Referer  to header file
sed -i '1s/^/Referer\n/' $j 


./log4j-scan.py -u "http://$i" --headers-file $j  --wait-time 1 --run-all-tests  &
./log4j-scan.py -u "https://$i" --headers-file $j --wait-time 1  --run-all-tests &
./log4j-scan.py -u "https://$i:8080" --headers-file $j --wait-time 1  --run-all-tests &
#sleep  .5
done
echo Sleeping for next after $i
sleep 5
#killall -9 python3
#killall -9 python3
done




