<g:if test="${books.size() > 0}">
    <div class="page-header">
        <h1>
            Book! <small>List of the book</small>
        </h1>
    </div>
    <table class="table table-bordered table-hover">
        <thead>
            <tr>
                <th>
                    Name
                </th>
                <th>
                    Author
                </th>
                <th>
                    Date Publication
                </th>
                <th>
                    Genre
                </th>
                <th>
                    Price
                </th>
                <th>
                    Actions
                </th>
            </tr>
        </thead>
        <tbody>
        <g:each var="book" in="${books}">
            <tr>
                <td>${book.name}</td>
                <td>${book.author}</td>
                <td>${book.datePublication}</td>
                <td>${book.genre}</td>
                <td>${book.price}</td>
                <td>
                    <%-- function to exxecute function of controller --%>
                    <g:remoteLink controller="book" action="change" update="divForm" id="${book.id}">Change</g:remoteLink>
                    <a href="#" onclick="deleteBook('${book.id}')">Excluir</a>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</g:if>
<g:else>
    <h2>
        Not found books to list!
    </h2>
</g:else>
