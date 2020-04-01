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
        
            <div style="width: 800px; display: block;">
                <canvas id="canvasChart"></canvas>
            </div>
        </section>
    </div>
    

    <asset:javascript src="Chart.js"/>

    <script>
        var ctx = document.getElementById('canvasChart');
        var canvasChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
                datasets: [{
                    label: '# of Votes',
                    data: [7, 9, 3, 5, 2, 3],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)',
                        'rgba(255, 206, 86, 0.2)',
                        'rgba(75, 192, 192, 0.2)',
                        'rgba(153, 102, 255, 0.2)',
                        'rgba(255, 159, 64, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)',
                        'rgba(255, 206, 86, 1)',
                        'rgba(75, 192, 192, 1)',
                        'rgba(153, 102, 255, 1)',
                        'rgba(255, 159, 64, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    </script>

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
