From documentation
## <span class="center-align">nice - run a program with modified scheduling priority</span>
The flags
```sh
 -n, --adjustment=N
```


The command goes like
```sh
nice -n 19 dms run --session 
```

This starts my DMS shell in least priority. It just means linux will give any process higher priority. In consequence maybe it will update less since its my bar.

Values of n: 

-20 (most favorable to the process) to 19 (least favorable to the process).