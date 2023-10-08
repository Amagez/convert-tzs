# convert-tzs

This is simple shell script to help us to convert input time to multiple timezone time in local Linux/MacOS. Sometimes we want a quick output for specific time to give other people information quickly.

## Installation

You may need to check if directory `/usr/local/bin/` exist in your environment `$PATH`.

```
$ git clone https://github.com/Amagez/convert-tzs.git
$ cd convert-tzs
$ chmod +x ctz.sh
$ mv ctz.sh /usr/local/bin/ctz
```

## Usage

You may need to update list of wished timezones in script.

```
$ vi /usr/local/bin/ctz
timezones=('Asia/Ho_Chi_Minh' 'Asia/Shanghai' 'Europe/Moscow' 'EST')
```

When you execute, please input time as 24 hours standard convention.

```
$ ctz 2030
Oct 09 13:30 UTC | Oct 09 20:30 VNZ | Oct 09 21:30 CST | Oct 09 16:30 MSK
```

It also supports only one string `now` or empty agrument will be `now` input.

```
$ ctz now
Oct 08 18:09 UTC | Oct 09 01:09 VNZ | Oct 09 02:09 CST | Oct 08 21:09 MSK

$ ctz
Oct 08 18:09 UTC | Oct 09 01:09 VNZ | Oct 09 02:09 CST | Oct 08 21:09 MSK
```

## Visit

Website : https://blog.amagez.com/
