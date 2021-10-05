# Day 10 Notes

## New File

```assembly
.data

hellostr: .asciz "The number is: %i\n"

.text

.global main

main:
  stp x29,x30,[sp,#-16]! ;Store Pair

  mov w2,2
  mov w3,3
  add w1,w2,w3
  ldr x0,=hellostr ; 


  mov w0,#0 ;Moving zero into register w0
  ldp x29,x30,[sp],16
  ret
```

<div id="code-element"></div>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
      axios({
      method: 'get',
      url: 'https://raw.githubusercontent.com/iotify/nsim-examples/master/functional-testing/alarm-server.js'
       })
      .then(function (response) {
         document.getElementById("code-element").innerHTML = response.data;
      });
</script>