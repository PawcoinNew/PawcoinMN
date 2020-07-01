# PawcoinMN Masternode Script

#### IMPORTANT ADVICE: Auto-masternode script tool is for install in fresh vps, you shouldnt install in machine that already have daemons with some balance due you will lost. Is suggested have a fresh VPS ubuntu with atleast 1 Gb RAM and 15 Gbs free space

A) IN WINDOWS WALLET:<br> 
Go to debug console and type:
```
getnewaddress MN1
```
Send 1.000 PWCs to the address and let it atleast confirm by 1 block
Generate the MN key  (in debug console)and save in txt:
```
createmasternodekey
```
Generate masternode outputs:
```
getmasternodeoutputs
```
It will give you something like this:  
```
txhash: "7a1ebb4baadf9ff39bbbfc2d58fd57ff15b65a5096069c8b232d3d312fb4xxxx",
outputidx: 1
```
you will only need to copy texOpen the masternode conf file and put:
```
MN1 IP:PORT(of vps)masternodekey masternodeouputs txnumber
EXAMPLE: 38.25.122.251:8322 7NEGGttKZojkAzViEYXXXxKTFdAtC2uSiMg8NSFqYVBtN6mYdU 7a1ebb4baadf9ff39bbbfc2d58fd57ff15b65a5096069c8XXX3fb4cb5c 1
```
Save masternode conf file, reopen wallet and in masternode section right-click START ALIAS
You need atleast 15 blocks confirmed before it start to work

B) IN VPS:<br>
Download the file: 
```
git clone https://github.com/PawcoinNew/PawcoinMN.git
cd PawcoinMN
```
Change the permissions:
```
chmod +x script.sh
```
Go back to vps and execute the script:
```
sudo ./script.sh
```
Wait, let it ask for genkey then put it by pressing control+V to paste the info you got in windows wallet and press enter to go on.
Let it finish and take note of the IP:PORT given at the end of the script execution

enjoy :)

