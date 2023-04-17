Machine setup for the Real Time Alchemy 2023 speedrun event, hosted on [RPG Limit Break](https://www.twitch.tv/rpglimitbreak).

Motivations:
* Runners are in a variety of countries, such as US, Australia, and Japan.
* Japanese runners may not want to be in voice chat with English speaking commenters.
* Rather than risk using my mediocre internet, I can use OBS and Discord on an AWS machine.
* Best control over audio levels.
* Want to have setup that isn't CLI based, for event organizers to use easier.

The machines:
* However many t2.micro RTMP servers I want. The point is to be close-ish to the runner, specs barely matter.
* Beefy g4dn.xlarge to run OBS and Discord, I hope.

Resources:
* [Use single SSH key pair for multiple regions](https://repost.aws/knowledge-center/ec2-ssh-key-pair-regions)
* [RTMPie](https://github.com/ngrie/rtmpie), project used to setup RTMP servers.

After initial setup, change password on ubuntu user for OBS machine. Not my most secure setup, but gets the job done. Probably manually edit the security group to tighten the security... I'll call it good enough with that, can't be bothered to set it all up in terraform.