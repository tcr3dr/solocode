# solocode

```
pip install --user -UI git+https://github.com/tcr3dr/solocode
```

## use

`cd` into the directory where your app code lives. Make sure you have a `requirements.txt` file that lists your dependencies.

With an Internet connection, run this in the folder where your code is:

```
solocode pack
```

This will create a file "solocode.tar.gz". Then connect to Solo's wifi and run:

```
solocode run server.py
```

Where "server.py" is the name of the file you want to use.

Try the example/ directory in this repo for an example server.

## license

MIT/Apache-2.0
