Machine setup for the Real Time Alchemy 2023 speedrun event, hosted on [RPG Limit Break](https://www.twitch.tv/rpglimitbreak).

It's not easy to organize a marathon with people all over the world. There were people from US, Australia, Japan, and Canada, and this does include a language barrier for the JP runners. One of RPG Limit Break's requirements for the marathon is that every run has English commentary.

To make streaming easy for everyone, RTMP servers were used. This means runners just need a URL and key, and they're set for streaming. This video feed is then picked up by an OBS instance in the cloud, which applies the appropriate marathon layout and streams to the RPGLB channel.

There were bitrate, size, and audio requirements for streaming. The video requirements were made clear to runners up front and were mostly straightforward (4:3 can introduce difficulties). The part that takes the most management is audio; there are multiple potential options, but having multiple commentators makes it more difficult and necessitates Discord. Worst case scenario, the machine OBS is on can handle all voices via Discord, but this introduces an audio lag to the stream. It's much better to have the runner output all audio to the RTMP server, if possible. However, this setup exists to account for most issues.

Furthermore, as this is a cloud setup, Discord was necessary for host audio between runs. The other tools used were Foobar (intermission music) and LiveSplit (timers).

To answer the "why did you run OBS in the cloud" question: I didn't want to sacrifice a machine, and also my internet likes to randomly die for a few minutes sometimes. AWS has incredible internet, you gotta give 'em that. There was also only one person running this event, ultimately, but it would be very easy to organize shifts for larger teams in longer marathons.

Fun weird issues: running RTMP in OBS without using it for too long (happens during setup) can introduce horrible audio (heard on stream only!). Making a new RTMP stream fixes this.

The machines:
* However many t2.micro RTMP servers I want. The point is to be close-ish to the runner, specs barely matter.
* Beefy g4dn.xlarge to run OBS. While this repo specifies an Ubuntu machine, I wound up using Windows (more expensive) because it was easier to wrangle with drivers, and it was also more familiar to the event organizer anyway. My regular machine died mid development so I didn't have the time to go through Ubuntu testing as much as I would have liked, and I'm unwilling to pay for more testing unless I do another event. Fun fact: you have to beg AWS for permission to use GPU EC2 instances. Ask for at least 4 vCPUs when you beg.

Resources:
* [Use single SSH key pair for multiple regions](https://repost.aws/knowledge-center/ec2-ssh-key-pair-regions)
* [RTMPie](https://github.com/ngrie/rtmpie), project used to setup RTMP servers.
