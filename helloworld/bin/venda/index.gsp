<html>
<head>
    <meta name="layout" content="main"/>
    <title>Order you Book</title>
    <%-- <g:if env="development"><asset:stylesheet src="errors.css"/></g:if> --%>
    <asset:stylesheet src="styles.css"/>
</head>
<body>
    <div id="content" role="main">
        <section class="container colset-2-its">
            <g:formRemote name="formOrder" id="formOrder" url="[controller: 'venda', action: 'save']" onSuccess="savedOrder(data)">
                <h2 class="text-center">Order to Book:</h2>

                <label>Name</label> <input type="text" name="name" /><br />
                <label>E-mail</label> <input type="email" name="email" /><br />

                <h2>Books</h2>
                <g:each in="${books}" var="book">
                    <input type="number" name="quantity" value="0" /> R$ ${String.format("%.2f",book.price)} ${book.name} <br />
                    <input type="hidden" name="id" value="${book.id}" />
                </g:each>

                <input type="submit" name="saveOrder" value="Save" />

            </g:formRemote>
        </section>
    </div>


    <script type="text/javascript">
        function savedOrder(data){
            if (data.response == "OK"){
                $("input[type=number]").val("0")
                $("input[type=text]").val("")
                alert("Your order has been successfully registered!")
            }else{
                alert("Wow, we have a problem.: " + data.response)
            }
        }
    </script>

</body>
</html>
