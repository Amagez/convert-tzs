# convert-tzs

This is simple shell script to help us to convert input time to multiple timezone time. Only convert hour, not convert date.

## Installation

You may need to check if directory `/usr/local/bin/` exist in your environment `$PATH`.

```
$ git clone https://github.com/cuongquach/convert-tzs.git
$ cd convert-tzs
$ chmod +x ctz.sh
$ mv ctz.sh /usr/local/bin/ctz
```

## Usage

You may need to update list of wished timezones in script.

```
$ vi /usr/local/bin/ctz
timezones=('Asia/Ho_Chi_Minh' 'Asia/Shanghai' 'Europe/Moscow')
```

When you execute, please input time as 24 hours standard convention.

```
$ ctz 2030
20:30 VNZ | 21:30 CST | 16:30 MSK
```

It also supports only one string `now` or empty agrument will be `now` input.

```
$ ctz now
16:50 VNZ | 17:50 CST | 12:50 MSK

$ ctz
16:51 VNZ | 17:51 CST | 12:51 MSK
```

## Visit

Website : https://cuongquach.com/
