<%-- <div id="messageForm" class="alert alert-success alert-dismissable" style="display: none;">			 
    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">
        ×
    </button>
    <h4>
        Alert!
    </h4> <strong>Warning!</strong> Best check yo self, you're not looking too good. <a href="#" class="alert-link">alert link</a>
</div> --%>

<div id="divMensagem"></div>

<g:formRemote name="formBook" url="[controller: 'book', action:'save']" update="divMensagem" onSucess="loadList()">
    <h2 class="text-center">Book creation form:</h2>

    <div class="form-group">
        <label for="inputName">
            Name
        </label>
        <input type="text" class="form-control" name="name" value="${book.name}" id="inputName">
    </div>
    <div class="form-group">
        <label for="inputAuthor">
            Author
        </label>
        <input type="text" class="form-control" name="author" value="${book.author}" id="inputAuthor">
    </div>
    <div class="form-group">
        <label for="inputDatePublication">
            Date Publication
        </label>
        <input type="text" class="form-control" name="datePublication" value="${book.datePublication}" id="inputDatePublication">
    </div>
    <div class="form-group">
        <label for="inputGenre">
            Genre
        </label>
        <input type="text" class="form-control" name="genre" value="${book.genre}" id="inputGenre">
    </div>
    <div class="form-group">
        <label for="inputPrice">
            Price
        </label>
        <input type="text" class="form-control" name="price" value="${book.price}" id="inputPrice">
    </div>
    <button type="submit" class="btn btn-primary">
        Submit
    </button>
    <input type="hidden" name="id" value="${book.id}" />
</g:formRemote>
