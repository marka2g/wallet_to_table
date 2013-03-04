## From Your Wallet To The Table
### This application will find the most efficient combination of menu items to buy given the amount of money in your wallet.

##### The code solves the problem dynamically with memoization.

#### To Begin:
```
$ git@github.com:marka2g/wallet_to_table.git
$ cd wallet_to_table
$ bundle install
```

#### Usage:
Given a file `menu.txt` containing a file in the following format:
```
$15.05
mixed fruit,$2.15
french fries,$2.75
side salad,$3.35
hot wings,$3.55
mozzarella sticks,$4.20
sampler plate,$5.80
```

#### Step 1:
```
from /wallet_to_table directory:
$ cd /bin/ && ./solve.rb
```

#### Step 2:
```
At Prompt:
enter a location of a menu file as a string. e.g.
a url:
http://www.tablexi.com/menu.txt
or local file location:
/Users/<usename>/path_to_text_file
```
##### Note: txt file must be in the following format.
```
$0.00
value, $0.00
```

#### Remote Option:
Alternatively, you run the remote option which will pull a text file from TableXI
 ```
To Run:
from /wallet_to_table directory:
$ cd /bin/ && ./remote_solve.rb
```