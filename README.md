## transmission-daemon with a modern UI
The snapshoot is here http://i.imgur.com/THBEybB.png
   <a href="http://imgur.com/THBEybB"><img src="http://i.imgur.com/THBEybB.png" title="source: imgur.com" /></a>
  

# Simplest Usage 
```
docker run -d -p 9091:9091 -P --name mytransmission yumin9822:transmission-daemon
```
Now you could connect to the transmission-daemon WebUI on http://IP Address:9091/ from anywhere (not only localhost)

You could use below command on your host to see the port forwarding information
```
docker port mytransmission
```

# Customized Usage
```
docker run -v /root/pt/settings.json:/settings.json \
	-v /home/download:/transmission/download \
	-d -p <remote web port>:9091 -p 51413 -p 51413/udp \
	--name mytransmission yumin9822:transmission-daemon
```
/root/pt/settings.json is your transmission-daemon config file. 

/home/download is your folder which stores downloaded files
