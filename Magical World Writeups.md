

**Challenge:** MagicalWorld (nc 49.213.52.6 10245)  

magical_world binary was given. Checked it first.
![](assets/Pasted image 20251108112512.png)

noticed stripped elf, PIE and stack Canary enabled. So addresses are randomized.
Then Opened it with IDA

![](assets/Pasted image 20251108113847.png)
I need to get to this if block and satisfy its conditions. And i noticed no overflow and attacks are needed, just need to satisfy the conditions to get here. so PIE and other protections doesn't do anything here really. 

Actual Input checking(From binaryNinja):
![](assets/Pasted image 20251108132417.png)

What i understood is that, input buffer must be 32 bit long and buf[0]='K' and bug[1]='S' must be satisfied.

i pasted the entire main function to ChatGPT and asked it to make a input such that it satisfies the condition checks to get the that *system("cat flag.txt")* portion.

![](assets/Pasted image 20251108114602.png)


Checking locally
![](assets/Pasted image 20251108114641.png)

It worked, Then

![](assets/Pasted image 20251108114731.png)









