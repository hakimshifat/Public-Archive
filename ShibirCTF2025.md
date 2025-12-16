<span class="center-align">Reverse Engineering</span>
# Returing is Hard
Just patching the program to execute the print_flag function was enough.
![](assets/2025-12-16_18-42.png)

![](assets/Pasted%20image%2020251216184412.png)

# Dhaka Data Breach

<span class="center-align">Miscellaneous</span>
# Slogran of July
![](assets/Pasted%20image%2020251216193613.png)
# Wanna Hang Haxina

using strings command
![](assets/Pasted%20image%2020251216192217.png)

This string appeared twice. so
![](assets/Pasted%20image%2020251216190314.png)
#### The file is a PNG image encrypted with ASCII Shift of +5
so,
```python
try:
    with open("encrypted.file", "rb") as f:
        data = f.read()
    decrypted = bytes([(b - 5) % 256 for b in data])   
    with open("flag.png", "wb") as f:
        f.write(decrypted)      
    print("Success! Open flag.png to see the image.")
except Exception as e:
    print(e)
```

That gives an image with the flag
![](assets/Pasted%20image%2020251216190723.png)

<span class="center-align">Steganography</span>
## Unlimited Crack
![](assets/Pasted%20image%2020251216193242.png)
![](assets/Pasted%20image%2020251216193317.png)
![](assets/Pasted%20image%2020251216193352.png)

# <span class="center-align">Forensics</span>

## Forensics - 1

It said something about digital signature. so i tried it. took a few attempts
![](assets/Pasted%20image%2020251216193933.png)

First thing i did was selected all texts with `Control+A` then made all font color to *black*
![](assets/Pasted%20image%2020251216194117.png)
That gave the first flag
![](assets/Pasted%20image%2020251216194150.png)