

**Challenge:** MagicalWorld (nc 49.213.52.6 10245)  

magical_world binary was given. Checked it first.
![](../attachments/Pasted%20image%2020251108112512.png)

noticed stripped elf, PIE and stack Canary enabled. So addresses are randomized.
Then Opened it with IDA

![](../attachments/Pasted%20image%2020251108113847.png)
I need to get to this if block and satisfy its conditions. And i noticed no overflow and attacks are needed, just need to satisfy the conditions to get here. so PIE and other protections doesn't do anything here really. 

Actual Input checking(From binaryNinja):
![](../attachments/Pasted%20image%2020251108132417.png)

What i understood is that, input buffer must be 32 bit long and buf[0]='K' and bug[1]='S' must be satisfied.

i pasted the entire main function to ChatGPT and asked it to make a input such that it satisfies the condition checks to get the that *system("cat flag.txt")* portion.

![](../attachments/Pasted%20image%2020251108114602.png)


Checking locally
![](../attachments/Pasted%20image%2020251108114641.png)

It worked, Then

![](../attachments/Pasted%20image%2020251108114731.png)









