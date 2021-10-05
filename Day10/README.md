<div id="code-element"></div>
<script src="https://unpkg.com/axios/dist/axios.min.js"></script>
<script>
      axios({
      method: 'get',
      url: 'https://raw.githubusercontent.com/kahleeeb3/CSC-241/main/Day10/hello.asm'
       })
      .then(function (response) {
         document.getElementById("code-element").innerHTML = response.data;
      });
</script>