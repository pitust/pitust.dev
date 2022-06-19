# frida-decompile service
Are you a bot developer and/or someone who wants a frida-decompile in their <thing>? If the answer is yes, then the frida-decompile service is for you! DM pitust#8711 to learn more.

## API usage
The API specification is available [here](https://hackmd.io/@pitust/decompiler-api).

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
```javascript
// Input
console.log('Hello, world!')
// Output
console.log("Hello, world!");
```

### Numbers and stuff
```javascript
// Input
const a = 3
const b = 4
console.log(a, b, a + b)
// Output
a = 3
b = 4
console.log(a, b, a + b);
// Experimental mode output
let a = 3
let b = 4
console.log(a, b, a + b)
```

### More complex exmaples
```javascript
// Input
let input = ask_user()
if (input.length == 5 && input.slice(0, 3) + input[4] == 'pas!' && input[3] == 's') {
    console.log('correct password!')
} else {
    console.log('incorrect password!')
}
// Experimental mode output
let input = ask_user()
if (!input.length == 5) goto(L102)
if (!input.slice(0, 3) + input[4] == 'pas!') goto(L102)
if (!input[3] == 's') goto(L102)
console.log('correct password!')
goto(L121)
L102:
console.log('incorrect password!')
L121:
```