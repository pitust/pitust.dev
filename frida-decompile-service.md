# frida-decompile service
Are you a bot developer and/or someone who wants a frida-decompile in their <thing>? If the answer is yes, then the frida-decompile service is for you! DM pitust#8711 to learn more.

## API usage
```
$ curl -X POST --data-binary @code.bin -H 'X-Frida-Decompile-JWT: YOUR TOKEN GOES HERE'  https://frida-decompile-service.pitust.dev/frida-decompile
```
In goes frida-compiled blob, out goes decompiled js. There is also a debug endpoint, /frida-decompile/debug.

## API example code
```python
import requests

def decompile(data: bytes) -> str:
    return requests.post('https://frida-decompile-service.pitust.dev/frida-decompile', data = data, headers={
        'X-Frida-Decompile-JWT': '<api key>'
    }).text
def decompile_debug(data: bytes) -> str:
    return requests.post('https://frida-decompile-service.pitust.dev/frida-decompile/debug', data = data, headers={
        'X-Frida-Decompile-JWT': '<api key>'
    }).text
```

## Examples

### Hello, world
In:
```javascript
console.log("Hello, world!")
```
Out:
```javascript
loc0 = console.log("Hello, world!");
return loc0;
```

### Numbers and stuff
In:
```javascript
const a = 3
const b = 4
console.log(a, b, a + b)
```
Out:
```javascript
a = 3
b = 4
loc0 = console.log(a, b, a + b);
return loc0;
```