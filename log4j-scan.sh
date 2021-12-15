killall -9 python3
killall -9 python3
killall -9 python3

sleep 2
for i in `cat $1`
do
echo URL: $i

rm -Rf headers-large_SPLIT*
split -l 69 headers-large.txt headers-large_SPLIT

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
