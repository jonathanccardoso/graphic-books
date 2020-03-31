<!doctype html>
<html>
<head>
    <meta name="layout" content="main"/> 
    <title>Welcome to index</title>

    <%-- need lib to use remoteLink --%>
    <g:javascript library="jquery" />	
</head>
<body>
    <div id="content" role="main">
        <section class="container colset-2-its">
            <h1>Welcome to GRUD BOOK</h1>
            <g:remoteLink controller="book" action="create" update="divForm">Create book</g:remoteLink>

            <div id="divList">
                <g:render template="list" model="[books: books]"></g:render>
            </div>
            
            <div id="divForm"></div>

        </section>
    </div>

</body>
</html>
