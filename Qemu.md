[[../3 - Tags/linux]] [[turotial]] 
First i got a folder named *qemu*

Then i copied windows10.iso here.

then
```bash
qemu-img create -f qcow2 image.img 30G
```

this creates an image called image.img . its size is 30G.

if it will be the virtual drive of the machine.

if i need to increate the size in future
```bash
 qemu-img resize image.img +10G
```

to run it
```bash
qemu-system-x86_64 -enable-kvm -cdrom tiny10.iso -boot menu=on -drive file=image.img -m 8G
```

this gives it 8GB ram.