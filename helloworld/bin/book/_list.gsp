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
                    #
                </th>
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
                <td>
                    <a href="#">Alterar</a>
                    <a href="#">Excluir</a>
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
